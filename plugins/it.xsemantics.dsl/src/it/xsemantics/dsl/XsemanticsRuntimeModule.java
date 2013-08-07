/*
 * generated by Xtext
 */
package it.xsemantics.dsl;

import it.xsemantics.dsl.generator.CustomXbaseCompiler;
import it.xsemantics.dsl.generator.XsemanticsOutputConfigurationProvider;
import it.xsemantics.dsl.scoping.XsemanticsScopeProvider;
import it.xsemantics.dsl.typing.XsemanticsTypeComputer;
import it.xsemantics.dsl.typing.XsemanticsTypeProvider;
import it.xsemantics.dsl.util.XsemanticsXExpressionHelper;

import org.eclipse.xtext.generator.IOutputConfigurationProvider;
import org.eclipse.xtext.generator.OutputConfigurationProvider;
import org.eclipse.xtext.scoping.IScopeProvider;
import org.eclipse.xtext.xbase.compiler.XbaseCompiler;
import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputer;
import org.eclipse.xtext.xbase.typing.ITypeProvider;
import org.eclipse.xtext.xbase.util.XExpressionHelper;

/**
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
public class XsemanticsRuntimeModule extends it.xsemantics.dsl.AbstractXsemanticsRuntimeModule {

	@Override
	public Class<? extends IScopeProvider> bindIScopeProvider() {
		return XsemanticsScopeProvider.class;
	}

	@Override
	public Class<? extends ITypeProvider> bindITypeProvider() {
		return XsemanticsTypeProvider.class;
	}
	
	@Override
	public Class<? extends ITypeComputer> bindITypeComputer() {
		return XsemanticsTypeComputer.class;
	}

	public Class<? extends IOutputConfigurationProvider> bindIOutputConfigurationProvider() {
		return XsemanticsOutputConfigurationProvider.class;
	}

	public Class<? extends OutputConfigurationProvider> bindOutputConfigurationProvider() {
		return XsemanticsOutputConfigurationProvider.class;
	}
	
	public Class<? extends XExpressionHelper> bindXExpressionHelper() {
		return XsemanticsXExpressionHelper.class;
	}

	public Class<? extends XbaseCompiler> bindXbaseCompiler() {
		return CustomXbaseCompiler.class;
	}

//	public Class<? extends XbaseCompiler> bindXbaseCompiler() {
//		return XsemanticsXbaseCompiler.class;
//	}
}
