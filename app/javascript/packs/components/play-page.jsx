import React, { Component } from "react";
import ReactDOM from "react-dom";

class MeditationPlay extends Component {
  // componentWillMount() {
  //   axios
  //     .get("api/v1/intentions.json", {}, { "Content-Type": "application/json" })
  //     .then(res => {
  //       this.setState({
  //         intentions: res.data.data,
  //         isLoading: true
  //       });
  //     });
  // }

  render() {
    return <div>Play meditation</div>;
  }
}
export default ReactDOM.render(
  <MeditationPlay />,
  document.getElementById("play-page")
);
