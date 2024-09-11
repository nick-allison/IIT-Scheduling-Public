import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/evaluations/rate_my_professor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RateMyProfessorLogic {
  final String firstName;
  final String lastName;

  RateMyProfessorLogic(this.firstName, this.lastName);

  Future<RateMyProfessor> getRMPData() async {
    final data = await Supabase.instance.client
        .from('ratemyprofessor')
        .select('*')
        .eq('first_name', firstName).eq('last_name', lastName)
        .execute();
    final rmpData = data.data as List;
    return rmpData.isNotEmpty ? RateMyProfessor.fromJson(rmpData[0]) : RateMyProfessor(firstName: '', lastName: '', rating: 0, numReviews: 0, pwta: 0, difficulty: 0);
  }
}