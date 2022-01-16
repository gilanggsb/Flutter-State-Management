import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profileb_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //add profile bloc and then call getAllUser
      create: (context) => ProfileBloc()..add(const ProfileEvent.getAllUser(2)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Learn Bloc State Management'),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            //return state
            return state.maybeMap(
              //if state not isLoading and isSuccess
              orElse: () {
                return Text('State $state');
              },
              //if state isLoading
              isLoading: (value) => const Center(
                child: CircularProgressIndicator(),
              ),
              //if state isSuccess
              isSuccess: (value) {
                return ListView.builder(
                  itemCount: value.user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                value.user[index].imageUrl,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Text(value.user[index].firstName),
                      subtitle: Text(value.user[index].lastName),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
