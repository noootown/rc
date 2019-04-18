function ws() {
  emulate -L zsh

  # define search context URLS
  typeset -A urls
  urls=(
    mdn             'https://developer.mozilla.org/search?q='
    html5please     'https://html5please.com/#'
    caniuse         'https://caniuse.com/#search='
    bootsnipp       'https://bootsnipp.com/search?q='
    cssflow         'https://www.cssflow.com/search?q='
    codepen         'https://codepen.io/search?q='
    smacss          'https://google.com/search?as_sitesearch=smacss.com&as_q='

    lodash          'https://devdocs.io/lodash/index#'
    ramda           'https://ramdajs.com/docs/#'
    rxmarbles       'https://rxmarbles.com/#'
    rxjs            'https://rxjs-dev.firebaseapp.com/api?query='
    reactjs         'https://google.com/search?as_sitesearch=facebook.github.io/react&as_q='
    react-native    'https://www.google.com/search?as_sitesearch=facebook.github.io/react-native&as_q='
    jest            'https://www.google.com/search?as_sitesearch=jestjs.io&as_q='
    chai            'https://www.google.com/search?as_sitesearch=www.chaijs.com/api&as_q='
    mocha           'https://mochajs.org/api/mocha#'
    webpack         'https://www.google.com/search?as_sitesearch=webpack.js.org/concepts&as_q='
    npm             'https://www.npmjs.com/search?q='

    stackoverflow   'https://stackoverflow.com/search?q='
    google          'https://www.google.com/search?q='
    yahoo           'https://search.yahoo.com/search?p='
    github          'https://github.com/search?q='
    youtube         'https://www.youtube.com/results?search_query='
    wiki            'https://zh.wikipedia.org/wiki/'
    map             'https://maps.google.com/?q='
    image           'https://www.google.com/search?tbm=isch&q='

    ptt             'https://www.google.com/search?hl=zh-TW&as_occt=title&as_sitesearch=http://www.ptt.cc/bbs&as_q='
    yahootrans      'https://tw.dictionary.search.yahoo.com/search?p='
  )

  # show help for command list
  if [[ $# -lt 2 ]]
  then
      print -P "Usage: ws %Ucontext%u %Uterm%u [...%Umore%u] (or just: %Ucontext%u %Uterm%u [...%Umore%u])"
      print -P ""
      print -P "%Uterm%u and what follows is what will be searched for in the %Ucontext%u website,"
      print -P "and %Ucontext%u is one of the following:"
      print -P ""
      print -P "For example: ws npmjs mocha (or just: npmjs mocha)."
      print -P ""
      return 1
  fi

  # check whether the search context is supported
  if [[ -z "$urls[$1]" ]]
  then
    echo "Search context \"$1\" currently not supported."
    echo ""
    echo "Valid contexts are:"
    echo ""
    echo ""
    return 1
  fi

  # build search url:
  # join arguments passed with '+', then append to search context URL
  # TODO substitute for proper urlencode method
  url="${urls[$1]}${(j:+:)@[2,-1]}"

  echo "Opening $url ..."

  open_command "$url"
}
