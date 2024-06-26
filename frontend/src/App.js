import React, { useState } from 'react';
import './App.css';

function App() {
  const [inputValue, setInputValue] = useState('');
  const [distribution, setDistribution] = useState('');
  const [error, setError] = useState('');

  const handleInput = (event) => {
    setInputValue(event.target.value);
  };

  const distributeCards = () => {
    const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ5b3VyZG9tYWluLmNvbSIsImlhdCI6MTcxOTM2ODA4OSwiZXhwIjoxNzE5MzcxNjg5LCJzdWIiOiJ5b3VyX3VzZXJuYW1lIn0.7Hn9LxqsAdROTc9hdtut5wf5Q6mjr4pYHuBwH_LmcGc'; // your jwt token
    fetch(`http://localhost/index.php?people=${inputValue}`, {
      headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
      }
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.error) {
          setError(data.error);
          setDistribution('');
        } else {
          setError('');
          setDistribution(data.distribution);
        }
      })
      .catch(() => {
        setError('Irregularity occurred');
        setDistribution('');
      });
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1 className="app-title">Playing Card Distribution</h1>
        <div className="input-container">
          <input
            type="number"
            placeholder="No. of People"
            value={inputValue}
            onChange={handleInput}
            className="input-number"
          />
          <button onClick={distributeCards} className="btn-distribute">
            Distribute Cards
          </button>
        </div>
        {error && <p className="error-message">{error}</p>}
        {distribution && (
          <div className="result-container">
            <h2 className="result-heading">Distribution Result</h2>
            <pre className="distribution-result">{distribution}</pre>
          </div>
        )}
      </header>
    </div>
  );
}

export default App;
