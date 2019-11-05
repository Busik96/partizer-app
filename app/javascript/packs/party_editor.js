import './styles.scss';
// Support component names relative to this directory:
var componentRequireContext = require.context("apps", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
