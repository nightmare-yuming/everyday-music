// Spotify API Configuration
// 請將 YOUR_CLIENT_ID_HERE 替換為您的 Spotify Client ID
// 在 https://developer.spotify.com/dashboard 建立應用程式後取得

const SPOTIFY_CONFIG = {
  clientId: '692826dd411b4436af9fac19e0049268', // 請替換為您的 Client ID
  redirectUri: 'https://nightmare-yuming.github.io/everyday-music/', // 本地開發用，部署時請修改
  scopes: [
    'streaming',
    'user-read-email',
    'user-read-private',
    'user-modify-playback-state',
    'user-read-playback-state'
  ]
};

// Spotify API Endpoints
const SPOTIFY_API = {
  authorize: 'https://accounts.spotify.com/authorize',
  token: 'https://accounts.spotify.com/api/token',
  search: 'https://api.spotify.com/v1/search',
  play: 'https://api.spotify.com/v1/me/player/play'
};
