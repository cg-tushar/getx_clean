# getx_clean

A new Flutter project.

## Getting Started

Note -> use Clean with getx 
1) use get create screen:screen/page name to create a new page 
2) while creating model class remember to extend base model class 
3) add model class in DI 
4) in controller page insted of getxController extend with GetxStateController
eg: creating a homeController 
 ##   class HomeController extends GetxStateController {
 ##     HomeController(this._fetchHeadlineUseCase) : super() {
 ##     controller = this;
 ##         }
 ##     final FetchHeadlineUseCase _fetchHeadlineUseCase;
 ##     }
 remember to call super and assign this to controller variable
 in the abouve example we do have only one use case ie; get headlines 
4) we can call api as following 
    
 ## call1() async {
 ##  await networkCalls(
 ##   _fetchHeadlineUseCase.execute(),
 ##   call: NetworkCall.one,
 ##  );
 ## } 
 (in controller "networkCalls" is a methord in GetxStateController) 
 we need to mention call: NetworkCall.one, ie; we are assigning this is NetworkCall one so we need to mention this in the ui as well Like 

## StateBuilder<HomeController>(
## child: (p0) {
## print(p0);   
##   return Text("Another api call"),
## },
## call: NetworkCall.one,
## )
NB: need to give type like <HomeController>
p0 will be our data from api or local

currently we can call up to 4 apis in a page like  call: NetworkCall.one,NetworkCall.two,etc..

below is an example of implementation of a repo 

## class ArticleRepositoryIml extends ArticleRepository {
## @override
##  Stream<Response> fetchHeadline() {
##   String getNews = 'top-headlines';
##    Map<String, String> query = {
##      "country": "us",
##      "category": "business",
##      "apiKey": "09a19abb37734481b72d84a90998c978"
##    };
##    return BaseApi().getRequest(path: getNews, cache: true, query: query).map(
##        (event) => NetResponseHandler<NewsModel>().response(event) as Response);
##  }
##  @override
##  Stream<Response> postData(int userId) {
##    throw UnimplementedError();
##  }
## }


insted of a future we are using Stream to get data so we need to map the stream as Following 
##    return BaseApi().getRequest(path: getNews, cache: true, query: query).map(
##        (event) => NetResponseHandler<NewsModel>().response(event) as Response);

here we are taking the row data Like json and converting it in to Response Type Response is a custom Class we are using to convert the data 