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
    fetch(`http://localhost/index.php?people=${inputValue}`)
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
