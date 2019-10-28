import React, { Component } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
function getTime(time) {
  if (!isNaN(time)) {
    return (
      Math.floor(time / 60) + ":" + ("0" + Math.floor(time % 60)).slice(-2)
    );
  }
}

class MeditationPlay extends Component {
  state = {
    isLoading: false,
    meditation: {},
    play: false,
    currentTime: 0.0,
    duration: 0.0
  };
  audio = document.querySelector("audio");

  togglePlay = () => {
    this.setState({ play: !this.state.play }, () => {
      this.state.play ? audio.play() : audio.pause();
    });
  };

  replayMeditation = () => {
    audio.currentTime = 0;
  };

  componentDidMount = () => {
    audio.addEventListener("timeupdate", e => {
      this.setState({
        currentTime: e.target.currentTime,
        duration: e.target.duration
      });
    });
  };

  componentWillUnmount = () => {
    this.audio.removeEventListener("timeupdate", () => {});
  };

  componentWillMount() {
    const currentHref = window.location.href.split("/");
    const id = currentHref[currentHref.length - 1];

    axios
      .get(
        `http://localhost:3000/api/v1/meditations/${id}`,
        {},
        { "Content-Type": "application/json" }
      )
      .then(res => {
        this.setState({
          meditation: res.data.data,
          isLoading: true
        });
      });
  }

  render() {
    const currentTime = getTime(this.state.currentTime);
    const duration = getTime(this.state.duration);
    const { meditation, isLoading } = this.state;
    return (
      <div>
        <h1>{isLoading ? meditation.name : ""}</h1>
        <p>{currentTime + "/" + duration}</p>
        <audio id="audio" src={meditation.meditationFile} />
        <button onClick={this.togglePlay}>
          {this.state.play ? "pause" : "play"}
        </button>
        <button onClick={this.replayMeditation}>Replay</button>
      </div>
    );
  }
}
export default ReactDOM.render(
  <MeditationPlay />,
  document.getElementById("play-page")
);
