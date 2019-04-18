#compdef ws

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion::complete:ws:*:commands' group-name commands
zstyle ':completion::complete:ws:*:ws_points' group-name ws_points
zstyle ':completion::complete:ws::' list-grouped

zmodload zsh/mapfile

function _ws() {
  local CONFIG=$HOME/.ws
  local ret=1

  local -a commands
  local -a ws_points

  ws_points=( "${(f)mapfile[$CONFIG]//$HOME/~}" )

  commands=(
    'mdn: MDN'
    'html5please: Html5 Please'
    'caniuse: Can I Use'
    'bootsnipp: Bootsnipp'
    'cssflow: CSS Flow'
    'codepen: Codepen'
    'smacss: Smacss'

    'lodash: Lodash'
    'ramda: Ramda'
    'rxmarbles: RXMarbles'
    'rxjs: RXjs'
    'reactjs: React'
    'react-native: React Native'
    'jest: Jest'
    'chai: Chai'
    'mocha: Mocha'
    'webpack: Webpack'
    'npm: NPM'

    'stackoverflow: StackOverflow'
    'google: Google'
    'yahoo: Yahoo'
    'github: Github'
    'youtube: Youtube'
    'wiki: WIKI'
    'map: Google Map'
    'image: Google Image'

    'ptt: PTT'
    'yahootrans: Yahoo Translate'
    'histock: HiStock'
  )

  _arguments -C \
    '1: :->first_arg' \
    '2: :->second_arg' && ret=0

  case $state in
    first_arg)
      _describe -t ws_points "Query" ws_points && ret=0
      _describe -t commands "Commands" commands && ret=0
      ;;
    second_arg)
      case $words[2] in
        mdn)
          _describe -t points "Query" ws_points && ret=0
          ;;
        html5please)
          _describe -t points "Query" ws_points && ret=0
          ;;
        caniuse)
          _describe -t points "Query" ws_points && ret=0
          ;;
        bootsnipp)
          _describe -t points "Query" ws_points && ret=0
          ;;
        cssflow)
          _describe -t points "Query" ws_points && ret=0
          ;;
        codepen)
          _describe -t points "Query" ws_points && ret=0
          ;;
        smacss)
          _describe -t points "Query" ws_points && ret=0
          ;;
        lodash)
          _describe -t points "Query" ws_points && ret=0
          ;;
        ramda)
          _describe -t points "Query" ws_points && ret=0
          ;;
        rxmarbles)
          _describe -t points "Query" ws_points && ret=0
          ;;
        rxjs)
          _describe -t points "Query" ws_points && ret=0
          ;;
        reactjs)
          _describe -t points "Query" ws_points && ret=0
          ;;
        react-native)
          _describe -t points "Query" ws_points && ret=0
          ;;
        jest)
          _describe -t points "Query" ws_points && ret=0
          ;;
        chai)
          _describe -t points "Query" ws_points && ret=0
          ;;
        mocha)
          _describe -t points "Query" ws_points && ret=0
          ;;
        webpack)
          _describe -t points "Query" ws_points && ret=0
          ;;
        npm)
          _describe -t points "Query" ws_points && ret=0
          ;;
        stackoverflow)
          _describe -t points "Query" ws_points && ret=0
          ;;
        google)
          _describe -t points "Query" ws_points && ret=0
          ;;
        yahoo)
          _describe -t points "Query" ws_points && ret=0
          ;;
        github)
          _describe -t points "Query" ws_points && ret=0
          ;;
        youtube)
          _describe -t points "Query" ws_points && ret=0
          ;;
        wiki)
          _describe -t points "Query" ws_points && ret=0
          ;;
        map)
          _describe -t points "Query" ws_points && ret=0
          ;;
        image)
          _describe -t points "Query" ws_points && ret=0
          ;;
        ptt)
          _describe -t points "Query" ws_points && ret=0
          ;;
        yahootrans)
          _describe -t points "Query" ws_points && ret=0
          ;;
        histock)
          _describe -t points "Query" ws_points && ret=0
          ;;
      esac
      ;;
  esac

  return $ret
}

_ws "$@"
