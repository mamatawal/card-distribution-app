<?php
    // Allow any origin to access this API
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET");
    header("Access-Control-Allow-Headers: Content-Type");
    header('Content-Type: application/json');

    // Handle input validation
    function validateInput($input) {
        return isset($input) && is_numeric($input) && $input > 0;
    }

    function generateDeck() {
        // Define card suits and values
        $suits = ['S', 'H', 'D', 'C'];
        $values = array_merge(['A'], range(2, 9), ['X', 'J', 'Q', 'K']);

        // Generate the deck of cards
        $deck = [];
        foreach ($suits as $suit) {
            foreach ($values as $value) {
                $deck[] = $suit . '-' . $value;
            }
        }

        // Shuffle the deck to randomize the order of cards
        shuffle($deck);

        return $deck;
    }

    function distributeCards($input) {
        $deck = generateDeck();

        // Calculate the total number of cards
        $totalCards = count($deck);
        
        // Determine the number of cards per person and the remaining cards
        $cardsPerPerson = floor($totalCards / $input);
        $remainingCards = $totalCards % $input;
        $startIndex = 0;
        $peopleCards = [];

        // Distribute cards among people
        for ($person = 1; $person <= $input; $person++) {
            $numCards = $cardsPerPerson + ($person <= $remainingCards ? 1 : 0);
            $peopleCards[] = array_slice($deck, $startIndex, $numCards);
            $startIndex += $numCards;
        }

        // Output the distributed cards
        $cardDistribution = [];
        foreach ($peopleCards as $person => $cards) {
            $cardDistribution[] = "Person " . ($person + 1) . ": " . implode(',', $cards) . PHP_EOL;
        }

        return $cardDistribution;
    }

    $input = $_GET['people'];

    if (!validateInput($input)) {
        echo json_encode(['error' => 'Input value does not exist or value is invalid']);
        exit();
    }

    $distribution = distributeCards($input);
    
    echo json_encode(['distribution' => $distribution]);
?>
