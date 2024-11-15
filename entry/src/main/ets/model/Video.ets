export class Video {
  avid: number;
  coverURL: string;
  title: string;
  publishTime: string;
  duration: number;
  shortLink: string;

  constructor(avid: number, coverURL: string, title: string, publishTime: string, duration: number, shortLink: string) {
    this.avid = avid;
    this.coverURL = coverURL;
    this.title = title;
    this.publishTime = publishTime;
    this.duration = duration;
    this.shortLink = shortLink;
  }
}