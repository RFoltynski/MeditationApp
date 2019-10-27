import React, { Component } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import ReactAudioPlayer from "react-audio-player";

class MeditationPlay extends Component {
  state = {
    isLoading: false,
    meditation: {}
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
    const { meditation, isLoading } = this.state;
    return (
      <div>
        <h1>{isLoading ? meditation.name : ""}</h1>
        <ReactAudioPlayer
          src={meditation.meditationFile}
          controls
          className="medi-player"
        />
      </div>
    );
  }
}
export default ReactDOM.render(
  <MeditationPlay />,
  document.getElementById("play-page")
);
