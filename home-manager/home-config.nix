{ config, pkgs, ... }:

let
  username = "heywoodlh";
  homedir = "/home/${username}";
  user_packages = [
    pkgs.ansible
    pkgs.bitwarden
    pkgs.bitwarden-cli
    pkgs.coreutils
    pkgs.discord
    pkgs.dos2unix
    pkgs.ffmpeg
    pkgs.firefox
    pkgs.fzf
    pkgs.gcc
    pkgs.git
    pkgs.github-cli
    pkgs.gnupg
    pkgs.go
    pkgs.htop
    pkgs.jq
    pkgs.maim
    pkgs.mesa
    pkgs.mosh
    pkgs.neofetch
    pkgs.openssh
    pkgs.pass
    pkgs.pinentry
    pkgs.pinentry-curses
    pkgs.pwgen
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.rofi
    pkgs.scdoc
    pkgs.screen
    pkgs.signal-desktop
    pkgs.syncthing
    pkgs.tcpdump
    pkgs.telnet
    pkgs.terminator
    pkgs.tmux
    pkgs.todo-txt-cli
    pkgs.tor
    pkgs.torsocks
    pkgs.veracrypt
    pkgs.vim
    pkgs.wireguard
    pkgs.xclip
  ];
in {
  home.username = "${username}";
  home.homeDirectory = "${homedir}";
  
  # Packages install
  home.packages = user_packages;

  # Firefox config
  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        extraConfig = ''
          user_pref("_user.js.parrot", "START: Oh yes, the Norwegian Blue... what's wrong with it?");
          user_pref("_user.js.parrot", "0100 syntax error: the parrot's dead!");
          user_pref("browser.shell.checkDefaultBrowser", true);
          user_pref("browser.startup.page", 0);
          user_pref("browser.startup.homepage", "https://the-empire.systems");
          user_pref("browser.newtabpage.enabled", false);
          user_pref("browser.newtab.preload", false);
          user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
          user_pref("browser.newtabpage.activity-stream.telemetry", false);
          user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");
          user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
          user_pref("browser.newtabpage.activity-stream.asrouter.providers.snippets", "");
          user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
          user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
          user_pref("browser.newtabpage.activity-stream.showSponsored", false);
          user_pref("_user.js.parrot", "0200 syntax error: the parrot's definitely deceased!");
          user_pref("browser.search.geoip.url", "");
          user_pref("browser.search.geoSpecificDefaults", false);
          user_pref("browser.search.geoSpecificDefaults.url", "");
          user_pref("intl.accept_languages", "en-US, en");
          user_pref("intl.charset.fallback.override", "windows-1252");
          user_pref("_user.js.parrot", "0300 syntax error: the parrot's not pinin' for the fjords!");
          user_pref("app.update.auto", false);
          user_pref("browser.search.update", false);
          user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
          user_pref("dom.ipc.plugins.reportCrashURL", false);
          user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
          user_pref("toolkit.telemetry.unified", false);
          user_pref("toolkit.telemetry.server", "data:,");
          user_pref("toolkit.telemetry.archive.enabled", false);
          user_pref("toolkit.coverage.endpoint.base", "");
          user_pref("datareporting.healthreport.uploadEnabled", false);
          user_pref("datareporting.policy.dataSubmissionEnabled", false);
          user_pref("app.shield.optoutstudies.enabled", false);
          user_pref("browser.discovery.enabled", false);
          user_pref("breakpad.reportURL", "");
          user_pref("captivedetect.canonicalURL", "");
          user_pref("network.connectivity-service.enabled", false);
          user_pref("_user.js.parrot", "0400 syntax error: the parrot's passed on!");
          user_pref("browser.safebrowsing.downloads.remote.enabled", false);
          user_pref("browser.safebrowsing.downloads.remote.url", "");
          user_pref("_user.js.parrot", "0500 syntax error: the parrot's cashed in 'is chips!");
          user_pref("app.normandy.enabled", false);
          user_pref("app.normandy.api_url", "");
          user_pref("browser.ping-centre.telemetry", false);
          user_pref("extensions.webcompat-reporter.enabled", false);
          user_pref("_user.js.parrot", "0600 syntax error: the parrot's no more!");
          user_pref("network.prefetch-next", false);
          user_pref("network.dns.disablePrefetch", true);
          user_pref("network.predictor.enabled", false);
          user_pref("network.http.speculative-parallel-limit", 0);
          user_pref("browser.send_pings.require_same_host", true);
          user_pref("_user.js.parrot", "0700 syntax error: the parrot's given up the ghost!");
          user_pref("network.dns.disableIPv6", true);
          user_pref("network.http.altsvc.enabled", false);
          user_pref("network.http.altsvc.oe", false);
          user_pref("network.proxy.socks_remote_dns", true);
          user_pref("_user.js.parrot", "0800 syntax error: the parrot's ceased to be!");
          user_pref("keyword.enabled", true);
          user_pref("browser.fixup.alternate.enabled", false);
          user_pref("browser.urlbar.trimURLs", false);
          user_pref("layout.css.visited_links_enabled", false);
          user_pref("browser.search.suggest.enabled", false);
          user_pref("browser.urlbar.suggest.searches", false);
          user_pref("browser.urlbar.usepreloadedtopurls.enabled", false);
          user_pref("browser.urlbar.speculativeConnect.enabled", false);
          user_pref("browser.formfill.enable", false);
          user_pref("browser.taskbar.lists.enabled", false);
          user_pref("browser.taskbar.lists.frequent.enabled", false);
          user_pref("browser.taskbar.lists.recent.enabled", false);
          user_pref("browser.taskbar.lists.tasks.enabled", false);
          user_pref("browser.taskbar.previews.enable", false);
          user_pref("_user.js.parrot", "0900 syntax error: the parrot's expired!");
          user_pref("security.ask_for_password", 2);
          user_pref("security.password_lifetime", 5);
          user_pref("signon.autofillForms", false);
          user_pref("signon.formlessCapture.enabled", false);
          user_pref("network.auth.subresource-http-auth-allow", 1);
          user_pref("_user.js.parrot", "1000 syntax error: the parrot's gone to meet 'is maker!");
          user_pref("browser.cache.disk.enable", false);
          user_pref("browser.sessionstore.privacy_level", 2);
          user_pref("browser.sessionstore.interval", 30000);
          user_pref("toolkit.winRegisterApplicationRestart", false);
          user_pref("browser.shell.shortcutFavicons", false);
          user_pref("_user.js.parrot", "1200 syntax error: the parrot's a stiff!");
          user_pref("security.ssl.require_safe_negotiation", true);
          user_pref("security.ssl.errorReporting.automatic", false);
          user_pref("security.ssl.errorReporting.enabled", false);
          user_pref("security.ssl.errorReporting.url", "");
          user_pref("security.tls.enable_0rtt_data", false);
          user_pref("security.ssl.enable_ocsp_stapling", true);
          user_pref("security.OCSP.enabled", 1);
          user_pref("security.OCSP.require", true);
          user_pref("security.pki.sha1_enforcement_level", 1);
          user_pref("security.family_safety.mode", 0);
          user_pref("security.cert_pinning.enforcement_level", 2);
          user_pref("security.mixed_content.block_display_content", true);
          user_pref("security.mixed_content.block_object_subrequest", true);
          user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
          user_pref("browser.ssl_override_behavior", 1);
          user_pref("browser.xul.error_pages.expert_bad_cert", true);
          user_pref("_user.js.parrot", "1400 syntax error: the parrot's bereft of life!");
          user_pref("browser.display.use_document_fonts", 0);
          user_pref("gfx.font_rendering.opentype_svg.enabled", false);
          user_pref("gfx.font_rendering.graphite.enabled", false);
          user_pref("_user.js.parrot", "1600 syntax error: the parrot rests in peace!");
          user_pref("network.http.referer.XOriginPolicy", 1);
          user_pref("network.http.referer.hideOnionSource", true);
          user_pref("privacy.donottrackheader.enabled", true);
          user_pref("_user.js.parrot", "1700 syntax error: the parrot's bit the dust!");
          user_pref("privacy.userContext.ui.enabled", true);
          user_pref("privacy.userContext.enabled", true);
          user_pref("privacy.userContext.longPressBehavior", 2);
          user_pref("_user.js.parrot", "1800 syntax error: the parrot's pushing up daisies!");
          user_pref("plugin.state.flash", 0);
          user_pref("media.gmp-widevinecdm.visible", false);
          user_pref("media.gmp-widevinecdm.enabled", false);
          user_pref("media.eme.enabled", false);
          user_pref("_user.js.parrot", "2000 syntax error: the parrot's snuffed it!");
          user_pref("media.peerconnection.enabled", false);
          user_pref("media.peerconnection.ice.default_address_only", true);
          user_pref("webgl.disabled", true);
          user_pref("webgl.enable-webgl2", false);
          user_pref("webgl.min_capability_mode", true);
          user_pref("webgl.disable-extensions", true);
          user_pref("webgl.disable-fail-if-major-performance-caveat", true);
          user_pref("media.getusermedia.screensharing.enabled", false);
          user_pref("media.getusermedia.browser.enabled", false);
          user_pref("media.getusermedia.audiocapture.enabled", false);
          user_pref("media.autoplay.enabled.user-gestures-needed", false);
          user_pref("_user.js.parrot", "2200 syntax error: the parrot's 'istory!");
          user_pref("dom.disable_window_open_feature.close", true);
          user_pref("dom.disable_window_open_feature.menubar", true);
          user_pref("dom.disable_window_open_feature.minimizable", true);
          user_pref("dom.disable_window_open_feature.titlebar", true);
          user_pref("dom.disable_window_open_feature.toolbar", true);
          user_pref("dom.disable_window_move_resize", true);
          user_pref("browser.link.open_newwindow", 3);
          user_pref("browser.link.open_newwindow.restriction", 0);
          user_pref("dom.disable_open_during_load", true);
          user_pref("dom.popup_allowed_events", "click dblclick");
          user_pref("_user.js.parrot", "2300 syntax error: the parrot's off the twig!");
          user_pref("dom.serviceWorkers.enabled", false);
          user_pref("dom.push.enabled", false);
          user_pref("_user.js.parrot", "2400 syntax error: the parrot's kicked the bucket!");
          user_pref("dom.event.clipboardevents.enabled", false);
          user_pref("dom.allow_cut_copy", true);
          user_pref("dom.disable_beforeunload", true);
          user_pref("dom.vibrator.enabled", false);
          user_pref("javascript.options.asmjs", false);
          user_pref("javascript.options.wasm", false);
          user_pref("dom.targetBlankNoOpener.enabled", true);
          user_pref("_user.js.parrot", "2500 syntax error: the parrot's shuffled off 'is mortal coil!");
          user_pref("media.navigator.enabled", false);
          user_pref("dom.webaudio.enabled", false);
          user_pref("_user.js.parrot", "2600 syntax error: the parrot's run down the curtain!");
          user_pref("accessibility.force_disabled", 1);
          user_pref("beacon.enabled", false);
          user_pref("browser.helperApps.deleteTempFileOnExit", true);
          user_pref("browser.tabs.remote.allowLinkedWebInFileUriProcess", false);
          user_pref("browser.uitour.enabled", false);
          user_pref("browser.uitour.url", "");
          user_pref("devtools.chrome.enabled", false);
          user_pref("devtools.debugger.remote-enabled", false);
          user_pref("devtools.webide.enabled", false);
          user_pref("middlemouse.contentLoadURL", false);
          user_pref("network.http.redirection-limit", 10);
          user_pref("permissions.manager.defaultsUrl", "");
          user_pref("webchannel.allowObject.urlWhitelist", "");
          user_pref("network.IDN_show_punycode", true);
          user_pref("network.protocol-handler.external.ms-windows-store", false);
          user_pref("browser.download.useDownloadDir", false);
          user_pref("browser.download.manager.addToRecentDocs", false);
          user_pref("browser.download.hide_plugins_without_extensions", false);
          user_pref("security.dialog_enable_delay", 700);
          user_pref("_user.js.parrot", "2700 syntax error: the parrot's joined the bleedin' choir invisible!");
          user_pref("network.cookie.cookieBehavior", 0);
          user_pref("network.cookie.thirdparty.sessionOnly", true);
          user_pref("browser.cache.offline.enable", false);
          user_pref("offline-apps.allow_by_default", false);
          user_pref("_user.js.parrot", "2800 syntax error: the parrot's bleedin' demised!");
          user_pref("privacy.sanitize.sanitizeOnShutdown", true);
          user_pref("privacy.clearOnShutdown.cache", true);
          user_pref("privacy.clearOnShutdown.cookies", true);
          user_pref("privacy.cpd.cache", true);
          user_pref("privacy.cpd.cookies", true);
          user_pref("privacy.sanitize.timeSpan", 0);
          user_pref("_user.js.parrot", "4000 syntax error: the parrot's pegged out");
          user_pref("privacy.firstparty.isolate", false);
          user_pref("_user.js.parrot", "4500 syntax error: the parrot's popped 'is clogs");
          user_pref("privacy.resistFingerprinting", true);
          user_pref("browser.startup.blankWindow", false);
          user_pref("_user.js.parrot", "4600 syntax error: the parrot's crossed the Jordan");
          user_pref("dom.enable_resource_timing", false);
          user_pref("dom.enable_performance", false);
          user_pref("browser.zoom.siteSpecific", false);
          user_pref("media.webspeech.synth.enabled", false);
          user_pref("media.video_stats.enabled", false);
          user_pref("media.ondevicechange.enabled", false);
          user_pref("webgl.enable-debug-renderer-info", false);
          user_pref("dom.w3c_pointer_events.enabled", false);
          user_pref("ui.use_standins_for_native_colors", true);
          user_pref("_user.js.parrot", "4700 syntax error: the parrot's taken 'is last bow");
          user_pref("_user.js.parrot", "5000 syntax error: this is an ex-parrot!");
          user_pref("_user.js.parrot", "9999 syntax error: the parrot's deprecated!");
          user_pref("experiments.enabled", false);
          user_pref("experiments.manifest.uri", "");
          user_pref("experiments.supported", false);
          user_pref("experiments.activeExperiment", false);
          user_pref("network.jar.block-remote-files", true);
          user_pref("network.jar.open-unsafe-types", false);
          user_pref("plugin.state.java", 0);
          user_pref("shield.savant.enabled", false);
          user_pref("media.autoplay.enabled", false);
          user_pref("browser.onboarding.enabled", false);
          user_pref("devtools.webide.autoinstallADBHelper", false);
          user_pref("devtools.webide.adbAddonURL", "");
          user_pref("security.csp.enable_violation_events", false);
          user_pref("browser.urlbar.autocomplete.enabled", false);
          user_pref("browser.chrome.errorReporter.enabled", false);
          user_pref("browser.chrome.errorReporter.submitUrl", "");
          user_pref("network.allow-experiments", false);
          user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
          user_pref("browser.aboutHomeSnippets.updateUrl", "");
          user_pref("lightweightThemes.update.enabled", false);
          user_pref("security.csp.experimentalEnabled", true);
          user_pref("_user.js.parrot", "SUCCESS: No no he's not dead, he's, he's restin'!"); 
        '';
      };
    };
  };

}
