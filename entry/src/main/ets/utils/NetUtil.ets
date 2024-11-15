import http from '@ohos.net.http'
import { VideoInfo } from '../model/VideoInfo'

const BASE_URL = 'http://47.99.85.149:8080/MongoDBAndSpark/API/'

export class NetUtil {
  getVideoData = (pageNum: number) => {
    let httpRequest = http.createHttp()
    httpRequest.request(
      `${BASE_URL}getVideo?pageNum=${pageNum}`,
      {
        method: http.RequestMethod.GET,
        connectTimeout: 1000,
        readTimeout: 1000,
      },
      (err, data: http.HttpResponse) => {
        let dataValue : Array<VideoInfo> = []
        if (!err) {
          console.info('test:data:' + JSON.stringify(data));
        } else {
          console.error('error:' + JSON.stringify(err));
          httpRequest.off('headersReceive');
        }
        httpRequest.destroy();
      }
    )
  }

  constructor() {
  }
}