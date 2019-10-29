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
    duration: 0.0,
    progress: 0,
    volume: 1,
    mute: false
  };
  audio = document.querySelector("audio");
  progress = 0;
  togglePlay = () => {
    this.setState({ play: !this.state.play }, () => {
      this.state.play ? audio.play() : audio.pause();
    });
  };

  replayMeditation = () => {
    audio.currentTime = 0;
  };

  moveForword = () => {
    audio.currentTime = audio.currentTime + 15;
  };

  moveBackword = () => {
    audio.currentTime = audio.currentTime - 15;
  };

  mute = () => {
    audio.muted = !audio.muted;
  };

  changeVolume = e => {
    this.setState({ volume: event.target.value });
    audio.volume = this.state.volume / 10;
    console.log(this.state.volume);
  };

  componentDidMount = () => {
    audio.addEventListener("timeupdate", e => {
      this.setState({
        currentTime: e.target.currentTime,
        duration: e.target.duration,
        progress: ((e.target.currentTime * 10) / e.target.duration) * 10
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
        <div className="progresBar">
          <div
            className="progresBar-currentTime"
            style={{ width: `${this.state.progress}%` }}
          ></div>
        </div>
        <audio id="audio" src={meditation.meditationFile} />
        <button onClick={this.togglePlay}>
          {this.state.play ? "pause" : "play"}
        </button>
        <button onClick={this.moveForword}>15+</button>
        <button onClick={this.moveBackword}>15-</button>
        <button onClick={this.replayMeditation}>replay</button>
        <input
          className={"slider-wrapper"}
          id="typeinp"
          type="range"
          min="0"
          max="10"
          step="1"
          value={this.state.volume}
          onChange={this.changeVolume}
          onClick={this.changeVolume}
        />
        <button onClick={this.mute}>mute</button>
      </div>
    );
  }
}
export default ReactDOM.render(
  <MeditationPlay />,
  document.getElementById("play-page")
);
