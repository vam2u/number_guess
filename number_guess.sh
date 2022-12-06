#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=user_guess -t --no-align -c"

SECRET_NUMBER=$((1 + $RANDOM % 1000))

echo -e "\nEnter your username:"
read USERNAME

GAMES_PLAYED=$($PSQL "SELECT count(user_guests_id) games_played FROM user_guess WHERE username = '$USERNAME' group by username;")
BEST_GUESS=$($PSQL "SELECT min(number_guesses) best_guess FROM user_guess WHERE username = '$USERNAME' group by username;")

if [[ $GAMES_PLAYED ]]; then
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
else
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
fi

INSERTED_ID=$($PSQL "WITH t AS (INSERT INTO user_guess(username,secret_number) VALUES('$USERNAME',$SECRET_NUMBER) RETURNING user_guests_id as inserted_id) SELECT inserted_id from t;")
GUESSED=0
TRIES=0
echo -e "\nGuess the secret number between 1 and 1000:"
while [[ $GUESSED = 0 ]]; do
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo -e "\nThat is not an integer, guess again:"
  elif [[ $SECRET_NUMBER = $GUESS ]]; then
    TRIES=$(($TRIES + 1))
    UPDATED_DATA=$($PSQL "UPDATE user_guess SET number_guesses=$TRIES, is_guessed='true' WHERE user_guests_id=$INSERTED_ID ;")
    echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
    GUESSED=1
  elif [[ $SECRET_NUMBER -gt $GUESS ]]; then
    TRIES=$(($TRIES + 1))
    echo -e "\nIt's higher than that, guess again:"
  else
    TRIES=$(($TRIES + 1))
    echo -e "\nIt's lower than that, guess again:"
  fi
done
