$out = powercfg.exe /DUPLICATESCHEME e9a42b02-d5df-448d-aa00-03f14749eb61;
if( $out -match '\s([a-f0-9-]{36})\s' ) {
    powercfg.exe /SETACTIVE $Matches[1];
}