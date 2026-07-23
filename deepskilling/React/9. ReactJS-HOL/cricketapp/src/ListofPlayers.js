import React from "react";

function ListofPlayers() {

    const players = [
        { name: "Virat", score: 95 },
        { name: "Rohit", score: 82 },
        { name: "Gill", score: 68 },
        { name: "Rahul", score: 55 },
        { name: "Hardik", score: 78 },
        { name: "Jadeja", score: 66 },
        { name: "Ashwin", score: 74 },
        { name: "Bumrah", score: 80 },
        { name: "Shami", score: 62 },
        { name: "Siraj", score: 58 },
        { name: "Kuldeep", score: 71 }
    ];

    const lowScore = players.filter(player => player.score < 70);

    return (
        <div>
            <h2>List of Players</h2>

            <h3>All Players</h3>

            <ul>
                {players.map((player, index) => (
                    <li key={index}>
                        {player.name} - {player.score}
                    </li>
                ))}
            </ul>

            <h3>Players with Score below 70</h3>

            <ul>
                {lowScore.map((player, index) => (
                    <li key={index}>
                        {player.name} - {player.score}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default ListofPlayers;