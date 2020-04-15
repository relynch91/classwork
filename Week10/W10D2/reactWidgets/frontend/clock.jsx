import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { time: new Date() }
    }

    tick() {
        this.setState({ time: new Date() })
    }

    componentDidMount() {
        this.interval = setInterval(this.tick.bind(this), 1000);
    }
    componentWillUnmount() {
        clearInterval(this.interval);
    }

    render() {
        return (
            <div className="clock"> 
                <h1>Our Clock</h1>
                <span>{this.state.time.getHours()}:</span>
                <span>{this.state.time.getMinutes()}:</span>
                <span>{this.state.time.getSeconds()}</span>
            </div>
        )
    };
}

export default Clock