import 'service.dart';

class CategoryRepository {
  CategoryRemoteService remoteService;

  CategoryRepository(this.remoteService);

  factory CategoryRepository.create() {
    return CategoryRepository(
      CategoryRemoteService(),
    );
  }

  void fetchAndGet() {
    var categories = remoteService.fetchCategory('1234');

    categories.then((data) {
      data.forEach((item) {
        print(item.name);
      });
    });
  }
}
