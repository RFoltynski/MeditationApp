import React, { Component } from "react";
import ReactDOM from "react-dom";

class Navbar extends Component {
  render() {
    return <div className="navbar">Navbar</div>;
  }
}
export default ReactDOM.render(<Navbar />, document.getElementById("navbar"));
