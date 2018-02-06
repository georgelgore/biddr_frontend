import React, { Component } from "react";
import ArtistLotList from "./ArtistLotList";
import { connect } from "react-redux";
import * as actions from "../../actions";
import { ScatterPlot } from "react-d3-basic";
import { withRouter } from "react-router-dom";
import { VictoryBar, VictoryChart, VictoryAxis, VictoryTheme } from "victory";

class Artist extends Component {
  getArtistId = () => {
    let url = window.location.href;
    return url.split("/").splice(4)[0];
  };

  findArtist = (newId, thisPropArtists) => {
    let newArtist = thisPropArtists.filter(
      artist => artist.id === parseInt(newId, 10)
    )[0];
    console.log("NEW ARTIST", newArtist);
    return newArtist;
  };

  findNextArtist = newId => {
    let newArtist = this.nextProps.artists.filter(
      artist => artist.id === parseInt(newId, 10)
    )[0];
    console.log("NEW ARTIST", newArtist);
    return newArtist;
  };

  makeData = lots => {
    const output = [];
    lots.map((lot, i) => output.push({ lot: `${i}`, price: lot.realized }));
    return output;
  };

  componentDidMount() {
    console.log("CDM MONT");
    this.props.updateDisplayArtist(this.getArtistId()) &&
      this.props.setArtist(
        this.findArtist(this.props.display_artist, this.props.artists)
      );
  }

  componentWillReceiveProps(nextProps) {
    console.log("IN NEXT PROPS", this.props, nextProps);
    if (this.props !== nextProps) {
      let artist = this.findArtist(nextProps.display_artist, nextProps.artists);
      this.props.setArtist(artist);
    }
    console.log("HEEEEEEEEY");
  }

  render() {
    console.log("artist", this.props);
    return (
      <div>
        {this.props.artist &&
        this.props.artist.constructor === Object &&
        Object.keys(this.props.artist).length > 0 ? (
          <div>
            <h1>{this.props.artist.name}</h1>
            {/*}<VictoryChart domainPadding={10} theme={VictoryTheme.material}>
              <VictoryAxis />
              <VictoryAxis
                dependentAxis
                tickFormat={x => `${x / 1000000000}B`}
              />
              <VictoryBar
                data={this.makeData(this.props.artist.lots)}
                x="year"
                y="sum"
              />
            </VictoryChart>
            />*/}
            <ArtistLotList lots={this.props.artist.lots} />
          </div>
        ) : (
          <h1>Loading</h1>
        )}
      </div>
    );
  }
}

const mapStateToProps = ({ artists, artist, display_artist }) => {
  return {
    artists,
    artist,
    display_artist
  };
};
export default withRouter(connect(mapStateToProps, actions)(Artist));
