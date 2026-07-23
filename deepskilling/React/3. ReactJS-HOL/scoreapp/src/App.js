import React from "react";
import CalculateScore from "./components/CalculateScore";

function App() {

  return (
    <div>

      <CalculateScore
        name="Mamatha Sri"
        school="Vignan Institute of Engineering for Women"
        total={450}
        goal={5}
      />

    </div>
  );
}

export default App;