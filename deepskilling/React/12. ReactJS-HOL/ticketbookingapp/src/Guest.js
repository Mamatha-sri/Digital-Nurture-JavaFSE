function Guest() {
    return (
        <div>
            <h2>Welcome Guest</h2>
            <h3>Flight Details</h3>

            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>Flight</th>
                        <th>From</th>
                        <th>To</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>AI101</td>
                        <td>Hyderabad</td>
                        <td>Delhi</td>
                    </tr>

                    <tr>
                        <td>6E220</td>
                        <td>Chennai</td>
                        <td>Mumbai</td>
                    </tr>
                </tbody>
            </table>

            <p><b>Please Login to Book Tickets.</b></p>
        </div>
    );
}

export default Guest;