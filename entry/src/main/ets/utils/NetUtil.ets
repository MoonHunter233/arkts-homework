import http from '@ohos.net.http'
import { VideoInfo } from '../model/VideoInfo'

const BASE_URL = 'http://47.99.85.149:8080/MongoDBAndSpark/API/'

export class NetUtil {
  solveData = (httpRequest: http.HttpRequest, err, data: http.HttpResponse, videoList: Array<VideoInfo>) => {
    if (!err) {
      // TODO problem of parse
      let dataResult: Array<VideoInfo> = JSON.parse(data.result.toString()) as Array<VideoInfo>;
      dataResult.forEach(item => {
        videoList.push(new VideoInfo(item.avid, item.coverURL, item.title, item.publishTime, item.duration, item.shortLink));
      })
      httpRequest.destroy();
    } else {
      console.error('test:error:' + JSON.stringify(err));
      httpRequest.off('headersReceive');
      httpRequest.destroy();
    }
  }
  getVideoData = (pageNum: number, videoList: Array<VideoInfo>) => {
    let httpRequest = http.createHttp()
    httpRequest.request(
      `${BASE_URL}getVideo?pageNum=${pageNum}`,
      {
        method: http.RequestMethod.GET,
        connectTimeout: 1000,
        readTimeout: 1000,
      },
      (err, data: http.HttpResponse) => {
        this.solveData(httpRequest, err, data, videoList);
      }
    )
  }
  searchVideoData = (keyword: string, pageNum: number, videoList: Array<VideoInfo>) => {
    let httpRequest = http.createHttp()
    httpRequest.request(
      `${BASE_URL}searchVideo?keyword=${keyword}&pageNum=${pageNum}`,
      {
        method: http.RequestMethod.GET,
        connectTimeout: 1000,
        readTimeout: 1000,
      },
      (err, data: http.HttpResponse) => {
        this.solveData(httpRequest, err, data, videoList);
      }
    )
  }

  constructor() {
  }
}