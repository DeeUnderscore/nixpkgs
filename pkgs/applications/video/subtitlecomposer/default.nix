{ mkDerivation
, lib
, fetchurl
, cmake
, extra-cmake-modules
, kcoreaddons
, sonnet
, kcodecs
, kross
, kxmlgui
, ki18n
, ffmpeg
, openal
, withSpeechRecognition ? true
, pocketsphinx }:
mkDerivation rec {
  pname = "subtitlecomposer";
  version = "0.7.1";

  src = fetchurl {
    url = "mirror://kde/stable/${pname}/${pname}-${version}.tar.xz";
    sha256 = "sha256-75yzwMH+H0DPnY55WFm5sorfLaO+d6B21GvCjfTNAlU=";
  };

  postPatch = ''
    substituteInPlace src/CMakeLists.txt \
      --replace 'SC_PLUGIN_INSTALL_DIR "''${CMAKE_INSTALL_PREFIX}/''${KDE_INSTALL_LIBDIR}/subtitlecomposer"' \
                'SC_PLUGIN_INSTALL_DIR "''${KDE_INSTALL_LIBDIR}/subtitlecomposer"'
  '';

  nativeBuildInputs = [ cmake extra-cmake-modules ];

  buildInputs = [
    kcoreaddons
    sonnet
    kcodecs
    kross
    kxmlgui
    ki18n
    ffmpeg
    openal
  ] ++ lib.optionals withSpeechRecognition [
    pocketsphinx # TODO: does not work
  ];



  meta = with lib; {
    homepage = "https://subtitlecomposer.kde.org";
    description = "Video subtitle editor";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ DeeUnderscore ];
  };
}
