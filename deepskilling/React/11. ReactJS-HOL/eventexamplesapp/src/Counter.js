import React, { Component } from "react";

class Counter extends Component {

    constructor() {
        super();
        this.state = {
            count: 0
        };
    }

    increment = () => {
        this.setState({ count: this.state.count + 1 });
    };

    decrement = () => {
        this.setState({ count: this.state.count - 1 });
    };

    sayHello = () => {
        alert("Hello! Counter Increased.");
    };

    handleIncrement = () => {
        this.increment();
        this.sayHello();
    };

    sayWelcome = (msg) => {
        alert(msg);
    };

    handleClick = () => {
        alert("I was clicked");
    };

    render() {
        return (
            <div>

                <h2>Counter : {this.state.count}</h2>

                <button onClick={this.handleIncrement}>
                    Increment
                </button>

                &nbsp;

                <button onClick={this.decrement}>
                    Decrement
                </button>

                <br /><br />

                <button onClick={() => this.sayWelcome("Welcome")}>
                    Say Welcome
                </button>

                <br /><br />

                <button onClick={this.handleClick}>
                    OnPress
                </button>

            </div>
        );
    }
}

export default Counter;