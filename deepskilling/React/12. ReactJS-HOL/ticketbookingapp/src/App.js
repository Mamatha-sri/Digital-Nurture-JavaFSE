import { useState } from "react";
import Guest from "./Guest";
import User from "./User";
import LoginButton from "./LoginButton";
import LogoutButton from "./LogoutButton";

function App() {

    const [isLoggedIn, setIsLoggedIn] = useState(false);

    if (isLoggedIn) {
        return (
            <div style={{ textAlign: "center", marginTop: "30px" }}>
                <User />
                <br />
                <LogoutButton onClick={() => setIsLoggedIn(false)} />
            </div>
        );
    }

    return (
        <div style={{ textAlign: "center", marginTop: "30px" }}>
            <Guest />
            <br />
            <LoginButton onClick={() => setIsLoggedIn(true)} />
        </div>
    );
}

export default App;