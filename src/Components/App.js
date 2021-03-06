import React, { Component } from "react";
import "./App.css";
import Navbar from "./Navbar.js";
import Home from "./Home.js";
import Analytics from "./Analytics.js";
import Auction from "./Sale/Auction";
import Year from "./Sale";
import Sale from "./Sale/Sale";
import ArtistContainer from "./Artists";
import Artist from "./Artists/Artist.js";
import { Route, Switch, withRouter } from "react-router-dom";
import { connect } from "react-redux";
import * as actions from "../actions";

class App extends Component {
  componentDidMount() {
    this.props.fetchSales() && this.props.fetchArtists();
  }

  render() {
    return (
      <div className="App">
        {this.props.loading ? (
          <div className="ui active centered inline loader" />
        ) : null}
        {this.props.sales && this.props.sales.length > 0 ? (
          <div>
            <Navbar />
            <div className="Main">
              <Switch>
                <Route exact path="/biddr/" component={Home} />
                <Route exact path="/biddr/analytics" component={Analytics} />
                <Route
                  exact
                  path="/biddr/auctions/:year"
                  render={({ match }) => {
                    return (
                      <Year
                        year={match.params.year}
                        sales={this.props.sales.filter(sale =>
                          sale.sale_date.slice(0, 4).includes(match.params.year)
                        )}
                      />
                    );
                  }}
                />
                <Route exact path="/biddr/auctions" component={Auction} />
                <Route
                  exact
                  path="/biddr/auctions/:year/:id"
                  render={({ match }) => {
                    return (
                      <Sale
                        year={match.params.year}
                        sale={
                          this.props.sales.filter(
                            sale => sale.id.toString() === match.params.id
                          )[0]
                            ? this.props.sales.filter(
                                sale => sale.id.toString() === match.params.id
                              )[0]
                            : {}
                        }
                      />
                    );
                  }}
                />
                <Route
                  exact
                  path="/biddr/artists"
                  render={({ match }) => {
                    return (
                      <ArtistContainer
                        updateDisplayArtist={this.updateDisplayArtist}
                      />
                    );
                  }}
                />
                <Route
                  exact
                  path="/biddr/artists/:id"
                  render={() => {
                    return <Artist />;
                  }}
                />
              </Switch>
            </div>
          </div>
        ) : (
          <div className="ui loading segment" />
        )}
      </div>
    );
  }
}

const mapStateToProps = ({ artists, sales }) => {
  return {
    artists,
    sales
  };
};

export default withRouter(connect(mapStateToProps, actions)(App));
