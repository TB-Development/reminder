// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//

import $ from "jquery"
global.$ = global.jQuery = $;

import "phoenix_html"
import "../static/js/breakpoints.min"
import "../static/js/browser.min"
import "../static/js/halcyonic-main"
import "../static/js/jquery.min"
import "../static/js/main"
import "../static/js/util"
