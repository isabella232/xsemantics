/*
 * generated by Xtext 2.20.0
 */
package org.eclipse.xsemantics.example.lambda.ide;

import com.google.inject.Guice;
import com.google.inject.Injector;
import org.eclipse.xsemantics.example.lambda.LambdaRuntimeModule;
import org.eclipse.xsemantics.example.lambda.LambdaStandaloneSetup;
import org.eclipse.xtext.util.Modules2;

/**
 * Initialization support for running Xtext languages as language servers.
 */
public class LambdaIdeSetup extends LambdaStandaloneSetup {

	@Override
	public Injector createInjector() {
		return Guice.createInjector(Modules2.mixin(new LambdaRuntimeModule(), new LambdaIdeModule()));
	}
	
}
