
import 'package:bill_splitter/Models/Person.dart';

class Payment {
  Person personWhoPaid = new Person();
  double amount = 0.0;

  PaymentState state = PaymentState.pending;

  Payment() {}
}

enum PaymentState {
  pending,
  solved,
  canceled,
}
