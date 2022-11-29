abstract class ParamUseCase<Type, Params> {
  Stream<Type> execute(Params useCase);
}
