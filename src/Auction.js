import React from "react";
import { Link } from "react-router-dom";

const Auction = () => {
  return (
    <div>
      <div className="ui huge header">Auctions</div>
      <br />
      <div className="ui container" style={{ fontSize: "20px" }}>
        <table className="ui very basic table">
          <tbody className="center aligned">
            <tr>
              <td>
                <Link to="/auctions/2006">2006</Link>
              </td>
              <td>
                <Link to="/auctions/2010">2010</Link>
              </td>
              <td>
                <Link to="/auctions/2014">2014</Link>
              </td>
            </tr>
            <tr>
              <td>
                <Link to="/auctions/2007">2007</Link>
              </td>
              <td>
                <Link to="/auctions/2011">2011</Link>
              </td>
              <td>
                <Link to="/auctions/2015">2015</Link>
              </td>
            </tr>
            <tr>
              <td>
                <Link to="/auctions/2008">2008</Link>
              </td>
              <td>
                <Link to="/auctions/2012">2012</Link>
              </td>
              <td>
                <Link to="/auctions/2016">2016</Link>
              </td>
            </tr>
            <tr>
              <td>
                <Link to="/auctions/2009">2009</Link>
              </td>
              <td>
                <Link to="/auctions/2013">2013</Link>
              </td>
              <td>
                <Link to="/auctions/2017">2017</Link>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <br />
      <br />
      <div className="ui large header">Analytics</div>
    </div>
  );
};

export default Auction;
