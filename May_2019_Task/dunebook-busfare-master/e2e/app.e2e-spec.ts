import { BusFarePage } from './app.po';

describe('bus-fare App', () => {
  let page: BusFarePage;

  beforeEach(() => {
    page = new BusFarePage();
  });

  it('should display welcome message', done => {
    page.navigateTo();
    page.getParagraphText()
      .then(msg => expect(msg).toEqual('Welcome to app!!'))
      .then(done, done.fail);
  });
});
