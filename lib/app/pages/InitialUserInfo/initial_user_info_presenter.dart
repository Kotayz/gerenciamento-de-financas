import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:gerenciar_financas_app/domain/usecases/save_user_info.dart';

class SaveUserInfoPresenter extends Presenter {
  Function onComplete;
  Function onError;

  final SaveUserInfoUseCase saveUserInfoUseCase;

  SaveUserInfoPresenter(userInfoRepo)
      : saveUserInfoUseCase = SaveUserInfoUseCase(userInfoRepo);

  void save(
    String name,
    String email,
    String phone,
    bool flagTipsEmail,
    bool flagTipsPhone,
    double monthlyIncome,
    double monthlyExpenses,
  ) {
    saveUserInfoUseCase.execute(
      _SaveUserInfoUseCaseObserver(this),
      SaveUserInfoUseCaseParams(
        name,
        email,
        phone,
        flagTipsEmail,
        flagTipsPhone,
        monthlyIncome,
        monthlyExpenses,
      ),
    );
  }

  @override
  void dispose() {
    saveUserInfoUseCase.dispose();
  }
}

class _SaveUserInfoUseCaseObserver extends Observer<void> {
  final SaveUserInfoPresenter presenter;

  _SaveUserInfoUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    if (presenter.onComplete == null) return;
    presenter.onComplete();
  }

  @override
  void onError(e) {
    if (presenter.onError == null) return;
    presenter.onError(e);
  }

  @override
  void onNext(response) {}
}
