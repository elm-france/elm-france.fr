/** @typedef {{load: (Promise<unknown>); flags: (unknown)}} ElmPagesInit */

/** @type ElmPagesInit */
export default {
  load: async function (elmLoaded) {
    const app = await elmLoaded;
    console.log("App loaded", app);
  },
  flags: function () {
    return "You can decode this in Shared.elm using Json.Decode.string!";
  },
};

const el = document.createElement("script");
const firstScript = document.getElementsByTagName("script")[0];
el.dataset.site = "LXIMOKPK";
el.dataset.spa = "auto";
// elm-pages doesn't update the canonical url on page change:
el.dataset.canonical = false;
el.defer = true;
el.src = "https://cdn.usefathom.com/script.js";
firstScript.parentNode.insertBefore(el, firstScript);
