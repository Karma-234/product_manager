dependencies:
			flutter pub add google_fonts flutter_screenutil sqfentity sqfentity_gen get loader_overlay 

dev-dependencies:
				flutter pub add  build_runner --dev
clean:
	flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	flutter pub get
	cd ios && pod install
	flutter run