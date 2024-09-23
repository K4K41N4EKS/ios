import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:second_lesson1/features/crypto_list/block/crypto_list_block.dart';
import 'package:second_lesson1/features/crypto_list/widgets/widgets.dart';
import 'package:second_lesson1/repositories/crypto_coins/crypto_coins.dart';
import 'package:second_lesson1/theme/theme.dart';

class CryptoListScreen extends StatefulWidget{
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen>{
  final _cryptoListBlock = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>());

  @override
    void initState() {
      _cryptoListBlock.add(LoadCryptoList());
      super.initState();
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBlock,
        builder: (context, state) {
          if(state is CryptoListLoaded)
          {
            return ListView.separated(
              padding: const EdgeInsets.only(top:16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i){
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
          }
          if(state is CryptoListLoadingFailure)
          {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: darkTheme.textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Please try again later',
                    style: darkTheme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                ],
              )
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      
      
    );
  }
}

