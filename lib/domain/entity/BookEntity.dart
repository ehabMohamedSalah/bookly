import '../../data_layer/model/book_response/AccessInfo.dart';
import '../../data_layer/model/book_response/SaleInfo.dart';
import '../../data_layer/model/book_response/SearchInfo.dart';
import '../../data_layer/model/book_response/VolumeInfo.dart';


/// kind : "books#volume"
/// id : "mIxQAAAAMAAJ"
/// etag : "KXwaY8hjqA0"
/// selfLink : "https://www.googleapis.com/books/v1/volumes/mIxQAAAAMAAJ"
/// volumeInfo : {"title":"Understanding Programming Languages","authors":["M. Ben-Ari"],"publishedDate":"1996-03-26","description":"This book compares constructs from C with constructs from Ada in terms of levels of abstractions. Studying these languages provides a firm foundation for an extensive examination of object-oriented language support in C++ and Ada 95. It explains what alternatives are available to the language designer, how language constructs should be used in terms of safety and readability, how language constructs are implemented and which ones can be efficiently compiled and the role of language in expressing and enforcing abstractions. The final chapters introduce functional (ML) and logic (Prolog) programming languages to demonstrate that imperative languages are not conceptual necessities for programming.","industryIdentifiers":[{"type":"OTHER","identifier":"UOM:39015037286278"}],"readingModes":{"text":false,"image":false},"pageCount":384,"printType":"BOOK","categories":["Computers"],"maturityRating":"NOT_MATURE","allowAnonLogging":false,"contentVersion":"0.9.6.0.preview.0","panelizationSummary":{"containsEpubBubbles":false,"containsImageBubbles":false},"imageLinks":{"smallThumbnail":"http://books.google.com/books/content?id=mIxQAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api","thumbnail":"http://books.google.com/books/content?id=mIxQAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"},"language":"en","previewLink":"http://books.google.com.eg/books?id=mIxQAAAAMAAJ&q=programming&dq=programming&hl=&cd=1&source=gbs_api","infoLink":"http://books.google.com.eg/books?id=mIxQAAAAMAAJ&dq=programming&hl=&source=gbs_api","canonicalVolumeLink":"https://books.google.com/books/about/Understanding_Programming_Languages.html?hl=&id=mIxQAAAAMAAJ"}
/// saleInfo : {"country":"EG","saleability":"NOT_FOR_SALE","isEbook":false}
/// accessInfo : {"country":"EG","viewability":"NO_PAGES","embeddable":false,"publicDomain":false,"textToSpeechPermission":"ALLOWED","epub":{"isAvailable":false},"pdf":{"isAvailable":false},"webReaderLink":"http://play.google.com/books/reader?id=mIxQAAAAMAAJ&hl=&source=gbs_api","accessViewStatus":"NONE","quoteSharingAllowed":false}
/// searchInfo : {"textSnippet":"This book compares constructs from C with constructs from Ada in terms of levels of abstractions."}

class BookEntity {
  BookEntity({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,});

   String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

}