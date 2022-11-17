abstract class IUseCase<T, P> {
  Future<T> call({required P params});
}
