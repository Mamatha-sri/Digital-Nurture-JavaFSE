import React, { useState } from "react";

function CurrencyConvertor() {

    const [rupees, setRupees] = useState("");
    const [euro, setEuro] = useState("");

    const handleSubmit = () => {

        const result = (rupees / 90).toFixed(2);

        setEuro(result);
    };

    return (

        <div>

            <h2>Currency Convertor</h2>

            <input
                type="number"
                placeholder="Enter Rupees"
                value={rupees}
                onChange={(e) => setRupees(e.target.value)}
            />

            <br /><br />

            <button onClick={handleSubmit}>
                Convert
            </button>

            <h3>Euro : € {euro}</h3>

        </div>

    );
}

export default CurrencyConvertor;