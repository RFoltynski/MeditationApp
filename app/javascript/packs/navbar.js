import React, { Component } from "react";
import ReactDOM from "react-dom";

class Navbar extends Component {
  render() {
    return (
      <div className="navbar">
        <div className="logo">
          <a href="/">Medi</a>
        </div>{" "}
        <a href="/users/edit">Edytuj Profil</a>{" "}
        <a href="/users/sign_out">Wyloguj</a>
      </div>
    );
  }
}
export default ReactDOM.render(<Navbar />, document.getElementById("navbar"));
