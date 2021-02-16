import axios from 'axios';

export default {
    methods: {
      async $api(url, data) {
        return (await axios({
          method: 'post',
          url,
          data
        }).catch(e => {
          console.log(e);
        })).data;
      }
    }
}

// mixins.js 공통 function -> webserver 호출하여 db 가져오게 (use axios)