import 'package:annotations/annotations.dart';
import 'package:redux/redux.dart';
part 'middleware.g.dart';

@middleware
class GetBidIncrement {
  GetBidIncrement();
}

GetBidIncrement getincr = GetBidIncrement();
