import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smartsign_tv/features/pairing/domain/failures/pairing_failures.dart';
import 'package:smartsign_tv/features/pairing/domain/repositories/i_pairing_repository.dart';
import 'package:smartsign_tv/features/pairing/domain/usecases/generate_pairing_code.dart';

class MockPairingRepository extends Mock implements IPairingRepository {}

void main() {
  group('GeneratePairingCode', () {
    late MockPairingRepository mockRepository;
    late GeneratePairingCode usecase;

    setUp(() {
      mockRepository = MockPairingRepository();
      usecase = GeneratePairingCode(mockRepository);
    });

    test(
      'should return a valid 6-digit pairing code on success',
      () async {
        // Arrange
        const expectedCode = '123456';
        when(mockRepository.generatePairingCode())
            .thenAnswer((_) async => const Right(expectedCode));

        // Act
        final result = await usecase();

        // Assert
        expect(result, const Right(expectedCode));
        verify(mockRepository.generatePairingCode()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test(
      'should return FirebaseAuthFailure on Firebase exception',
      () async {
        // Arrange
        when(mockRepository.generatePairingCode()).thenAnswer(
          (_) async => Left(
            FirebaseAuthFailure('Firebase connection failed'),
          ),
        );

        // Act
        final result = await usecase();

        // Assert
        expect(result, isA<Left<PairingFailure, String>>());
        verify(mockRepository.generatePairingCode()).called(1);
      },
    );

    test(
      'should return UnexpectedFailure on unexpected exception',
      () async {
        // Arrange
        when(mockRepository.generatePairingCode())
            .thenThrow(Exception('Unexpected error'));

        // Act
        final result = await usecase();

        // Assert
        expect(result, isA<Left<UnexpectedFailure, String>>());
      },
    );
  });
}
