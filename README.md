# Playing Card Distribution App

This application allows you to distribute a deck of playing cards to a specified number of people. The distribution is randomized, ensuring a fair and random assignment of cards to each person.

## Technologies Used

- **Backend:**
  - PHP
  - Apache Web Server
  - Docker

- **Frontend:**
  - React.js
  - HTML
  - CSS
  - Docker

## Setup

1. Clone this repository to your local machine
2. Navigate to the `card-distribution-app` directory: `cd card-distribution-app`
3. Start the app using Docker: `docker-compose up`
4. Open your web browser and visit: [http://localhost:3000](http://localhost:3000)

## How to Use

1. Enter the desired number of people in the input field.
2. Click the "Distribute Cards" button.
3. The result will show the distribution of cards for each person.

## Notes

- The frontend is developed using React.js, providing an interactive user interface for input and displaying results.
- The backend is written in PHP and handles the random distribution of cards among people.
- The frontend communicates with the backend using HTTP requests to fetch the distribution result.
- The card distribution logic ensures fairness and randomization by shuffling the deck of cards before distributing.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
