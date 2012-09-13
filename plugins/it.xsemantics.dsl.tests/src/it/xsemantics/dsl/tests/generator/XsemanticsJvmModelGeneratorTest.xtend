package it.xsemantics.dsl.tests.generator

import com.google.inject.Inject
import it.xsemantics.dsl.tests.XsemanticsBaseTest
import it.xsemantics.dsl.tests.XsemanticsCompilationTestHelper
import it.xsemantics.dsl.tests.XsemanticsInjectorProviderCustom
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static junit.framework.Assert.*
import it.xsemantics.dsl.xsemantics.XsemanticsSystem

@InjectWith(typeof(XsemanticsInjectorProviderCustom))
@RunWith(typeof(XtextRunner))
class XsemanticsJvmModelGeneratorTest extends XsemanticsBaseTest {
	
	@Inject extension XsemanticsCompilationTestHelper
	
	@Test
	def testJudgmentDescriptions() {
		testFiles.testJudgmentDescriptions.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class TypeSystem extends XsemanticsRuntimeSystem {
  private PolymorphicDispatcher<Result<Boolean>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 4, "|-", ":");
  }
  
  public Result<Boolean> type(final List<String> list, final Set<Integer> set) {
    return type(new RuleEnvironment(), null, list, set);
  }
  
  public Result<Boolean> type(final RuleEnvironment _environment_, final List<String> list, final Set<Integer> set) {
    return type(_environment_, null, list, set);
  }
  
  public Result<Boolean> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final List<String> list, final Set<Integer> set) {
    try {
    	return typeInternal(_environment_, _trace_, list, set);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  protected Result<Boolean> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final List<String> list, final Set<Integer> set) {
    try {
    	checkParamsNotNull(list, set);
    	return typeDispatcher.invoke(_environment_, _trace_, list, set);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final List<String> list, final Set<Integer> set, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
}
'''
		)
	}
	
	@Test
	def testSimpleRule() {
		testFiles.testSimpleRule.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import com.google.common.base.Objects;
import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EcoreFactory;
import org.eclipse.xtext.util.PolymorphicDispatcher;
import org.eclipse.xtext.xbase.lib.StringExtensions;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String ECLASSEOBJECT = "it.xsemantics.test.rules.EClassEObject";
  
  private PolymorphicDispatcher<Result<Boolean>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 4, "|-", ":");
  }
  
  public Result<Boolean> type(final EClass c, final EObject o) {
    return type(new RuleEnvironment(), null, c, o);
  }
  
  public Result<Boolean> type(final RuleEnvironment _environment_, final EClass c, final EObject o) {
    return type(_environment_, null, c, o);
  }
  
  public Result<Boolean> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c, final EObject o) {
    try {
    	return typeInternal(_environment_, _trace_, c, o);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  protected Result<Boolean> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c, final EObject o) {
    try {
    	checkParamsNotNull(c, o);
    	return typeDispatcher.invoke(_environment_, _trace_, c, o);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EClass c, final EObject o, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<Boolean> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass eClass, final EObject object) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleEClassEObject(G, _subtrace_, eClass, object);
      addToTrace(_trace_, ruleName("EClassEObject") + stringRepForEnv(G) + " |- " + stringRep(eClass) + " : " + stringRep(object));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleEClassEObject) {
      typeThrowException(ruleName("EClassEObject") + stringRepForEnv(G) + " |- " + stringRep(eClass) + " : " + stringRep(object),
      	ECLASSEOBJECT,
      	e_applyRuleEClassEObject, eClass, object, new ErrorInformation[] {new ErrorInformation(eClass), new ErrorInformation(object)});
      return null;
    }
  }
  
  protected Result<Boolean> applyRuleEClassEObject(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass eClass, final EObject object) throws RuleFailedException {
    
    {
      String _string = new String();
      String _firstUpper = StringExtensions.toFirstUpper("bar");
      String _plus = (_string + _firstUpper);
      boolean _equals = Objects.equal("foo", _plus);
      /* 'foo' == new String() + "bar".toFirstUpper */
      if (!_equals) {
        sneakyThrowRuleFailedException("\'foo\' == new String() + \"bar\".toFirstUpper");
      }
      final EClass eC = EcoreFactory.eINSTANCE.createEClass();
      eC.setName("MyEClass");
      boolean _equals_1 = Objects.equal(eClass, eC);
      /* eClass == eC */
      if (!Boolean.valueOf(_equals_1)) {
        sneakyThrowRuleFailedException("eClass == eC");
      }
    }
    return new Result<Boolean>(true);
  }
}
'''
		)
	}
	
	@Test
	def testRuleWithTwoOutputParams() {
		testFiles.testRuleWithTwoOutputParams.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.Result2;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String ECLASSEOBJECTESTRUCTURALFEATURE = "it.xsemantics.test.rules.EClassEObjectEStructuralFeature";
  
  private PolymorphicDispatcher<Result<EObject>> typeDispatcher;
  
  private PolymorphicDispatcher<Result2<EObject,EStructuralFeature>> type2Dispatcher;
  
  private PolymorphicDispatcher<Result<EObject>> subtypeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 4, "|-", ":", ":");
    type2Dispatcher = buildPolymorphicDispatcher2(
    	"type2Impl", 3, "||-", ":", ":");
    subtypeDispatcher = buildPolymorphicDispatcher1(
    	"subtypeImpl", 4, "||-", "<:", ":>");
  }
  
  public Result<EObject> type(final EClass c, final EStructuralFeature f) {
    return type(new RuleEnvironment(), null, c, f);
  }
  
  public Result<EObject> type(final RuleEnvironment _environment_, final EClass c, final EStructuralFeature f) {
    return type(_environment_, null, c, f);
  }
  
  public Result<EObject> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c, final EStructuralFeature f) {
    try {
    	return typeInternal(_environment_, _trace_, c, f);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  public Result2<EObject,EStructuralFeature> type2(final EClass c) {
    return type2(new RuleEnvironment(), null, c);
  }
  
  public Result2<EObject,EStructuralFeature> type2(final RuleEnvironment _environment_, final EClass c) {
    return type2(_environment_, null, c);
  }
  
  public Result2<EObject,EStructuralFeature> type2(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c) {
    try {
    	return type2Internal(_environment_, _trace_, c);
    } catch (Exception _e_type2) {
    	return resultForFailure2(_e_type2);
    }
  }
  
  public Result<EObject> subtype(final EClass c, final EStructuralFeature f) {
    return subtype(new RuleEnvironment(), null, c, f);
  }
  
  public Result<EObject> subtype(final RuleEnvironment _environment_, final EClass c, final EStructuralFeature f) {
    return subtype(_environment_, null, c, f);
  }
  
  public Result<EObject> subtype(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c, final EStructuralFeature f) {
    try {
    	return subtypeInternal(_environment_, _trace_, c, f);
    } catch (Exception _e_subtype) {
    	return resultForFailure(_e_subtype);
    }
  }
  
  protected Result<EObject> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c, final EStructuralFeature f) {
    try {
    	checkParamsNotNull(c, f);
    	return typeDispatcher.invoke(_environment_, _trace_, c, f);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EClass c, final EStructuralFeature f, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result2<EObject,EStructuralFeature> type2Internal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c) {
    try {
    	checkParamsNotNull(c);
    	return type2Dispatcher.invoke(_environment_, _trace_, c);
    } catch (Exception _e_type2) {
    	sneakyThrowRuleFailedException(_e_type2);
    	return null;
    }
  }
  
  protected void type2ThrowException(final String _error, final String _issue, final Exception _ex, final EClass c, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EObject> subtypeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c, final EStructuralFeature f) {
    try {
    	checkParamsNotNull(c, f);
    	return subtypeDispatcher.invoke(_environment_, _trace_, c, f);
    } catch (Exception _e_subtype) {
    	sneakyThrowRuleFailedException(_e_subtype);
    	return null;
    }
  }
  
  protected void subtypeThrowException(final String _error, final String _issue, final Exception _ex, final EClass c, final EStructuralFeature f, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result2<EObject,EStructuralFeature> type2Impl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass eClass) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result2<EObject,EStructuralFeature> _result_ = applyRuleEClassEObjectEStructuralFeature(G, _subtrace_, eClass);
      addToTrace(_trace_, ruleName("EClassEObjectEStructuralFeature") + stringRepForEnv(G) + " ||- " + stringRep(eClass) + " : " + stringRep(_result_.getFirst()) + " : " + stringRep(_result_.getSecond()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleEClassEObjectEStructuralFeature) {
      type2ThrowException(ruleName("EClassEObjectEStructuralFeature") + stringRepForEnv(G) + " ||- " + stringRep(eClass) + " : " + "EObject" + " : " + "EStructuralFeature",
      	ECLASSEOBJECTESTRUCTURALFEATURE,
      	e_applyRuleEClassEObjectEStructuralFeature, eClass, new ErrorInformation[] {new ErrorInformation(eClass)});
      return null;
    }
  }
  
  protected Result2<EObject,EStructuralFeature> applyRuleEClassEObjectEStructuralFeature(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass eClass) throws RuleFailedException {
    EObject object = null; // output parameter
    EStructuralFeature feat = null; // output parameter
    
    /* G ||- eClass : object : feat */
    Result2<EObject,EStructuralFeature> result = type2Internal(G, _trace_, eClass);
    checkAssignableTo(result.getFirst(), EObject.class);
    object = (EObject) result.getFirst();
    checkAssignableTo(result.getSecond(), EStructuralFeature.class);
    feat = (EStructuralFeature) result.getSecond();
    
    return new Result2<EObject,EStructuralFeature>(object, feat);
  }
}
'''
		)
	}
	
	@Test
	def testJudgmentDescriptionsWithErrorSpecification() {
		testFiles.testJudgmentDescriptionsWithErrorSpecification.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class TypeSystem extends XsemanticsRuntimeSystem {
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
  }
  
  public Result<EClass> type(final EObject c) {
    return type(new RuleEnvironment(), null, c);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject c) {
    return type(_environment_, null, c);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject c) {
    try {
    	return typeInternal(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject c) {
    try {
    	checkParamsNotNull(c);
    	return typeDispatcher.invoke(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject c, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    
    String _plus = ("this " + c);
    String _plus_1 = (_plus + " made an error!");
    String error = _plus_1;
    EObject source = c;
    EClass _eClass = c.eClass();
    EStructuralFeature _eContainingFeature = _eClass.eContainingFeature();
    EStructuralFeature feature = _eContainingFeature;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(source, feature));
  }
}
'''
		)
	}

	@Test
	def testCheckRule() {
		testFiles.testCheckRule.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String EOBJECTECLASS = "it.xsemantics.test.rules.EObjectEClass";
  
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
  }
  
  public Result<EClass> type(final EObject c) {
    return type(new RuleEnvironment(), null, c);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject c) {
    return type(_environment_, null, c);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject c) {
    try {
    	return typeInternal(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  public Result<Boolean> checkEObject(final EObject obj) {
    try {
    	return checkEObjectInternal(null, obj);
    } catch (Exception e) {
    	return resultForFailure(e);
    }
  }
  
  protected Result<Boolean> checkEObjectInternal(final RuleApplicationTrace _trace_, final EObject obj) throws RuleFailedException {
    
    {
      EClass result = null;
      /* empty |- obj : result */
      Result<EClass> result_1 = typeInternal(emptyEnvironment(), _trace_, obj);
      checkAssignableTo(result_1.getFirst(), EClass.class);
      result = (EClass) result_1.getFirst();
      
    }
    return new Result<Boolean>(true);
  }
  
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject c) {
    try {
    	checkParamsNotNull(c);
    	return typeDispatcher.invoke(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject c, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject object) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleEObjectEClass(G, _subtrace_, object);
      addToTrace(_trace_, ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(object) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleEObjectEClass) {
      typeThrowException(ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(object) + " : " + "EClass",
      	EOBJECTECLASS,
      	e_applyRuleEObjectEClass, object, new ErrorInformation[] {new ErrorInformation(object)});
      return null;
    }
  }
  
  protected Result<EClass> applyRuleEObjectEClass(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject object) throws RuleFailedException {
    
    EClass _eClass = object.eClass();
    return new Result<EClass>(_eClass);
  }
}
'''
		)
	}

	@Test
	def testValidator() {
		testFiles.testCheckRule.assertCorrectJavaCodeGeneration(
			null,
'''
package it.xsemantics.test.validation;

import com.google.inject.Inject;
import it.xsemantics.runtime.validation.XsemanticsValidatorErrorGenerator;
import it.xsemantics.test.TypeSystem;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.validation.AbstractDeclarativeValidator;
import org.eclipse.xtext.validation.Check;

public class TypeSystemValidator extends AbstractDeclarativeValidator {
  @Inject
  protected XsemanticsValidatorErrorGenerator errorGenerator;
  
  @Inject
  protected TypeSystem xsemanticsSystem;
  
  protected TypeSystem getXsemanticsSystem() {
    return this.xsemanticsSystem;
  }
  
  @Check
  public void checkEObject(final EObject obj) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkEObject(obj),
    		obj);
  }
}
'''
		)
	}

	@Test
	def testAccessToInjectedFields() {
		testFiles.testAccessToInjectedFields.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import com.google.inject.Inject;
import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import java.util.List;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.util.PolymorphicDispatcher;
import org.eclipse.xtext.xbase.lib.InputOutput;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String EOBJECTECLASS = "it.xsemantics.test.rules.EObjectEClass";
  
  /**
   * a utility field
   */
  @Inject
  private List<String> strings;
  
  @Inject
  private String myString;
  
  /**
   * another utility field
   */
  @Inject
  private List<EClass> eClasses;
  
  @Inject
  private List<EClass> classes;
  
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
  }
  
  public List<String> getStrings() {
    return this.strings;
  }
  
  public void setStrings(final List<String> strings) {
    this.strings = strings;
  }
  
  public String getMyString() {
    return this.myString;
  }
  
  public void setMyString(final String myString) {
    this.myString = myString;
  }
  
  public List<EClass> getEClasses() {
    return this.eClasses;
  }
  
  public void setEClasses(final List<EClass> eClasses) {
    this.eClasses = eClasses;
  }
  
  public List<EClass> getClasses() {
    return this.classes;
  }
  
  public void setClasses(final List<EClass> classes) {
    this.classes = classes;
  }
  
  public Result<EClass> type(final EObject o) {
    return type(new RuleEnvironment(), null, o);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject o) {
    return type(_environment_, null, o);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject o) {
    try {
    	return typeInternal(_environment_, _trace_, o);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject o) {
    try {
    	checkParamsNotNull(o);
    	return typeDispatcher.invoke(_environment_, _trace_, o);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject o, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleEObjectEClass(G, _subtrace_, o);
      addToTrace(_trace_, ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleEObjectEClass) {
      typeThrowException(ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + "EClass",
      	EOBJECTECLASS,
      	e_applyRuleEObjectEClass, o, new ErrorInformation[] {new ErrorInformation(o)});
      return null;
    }
  }
  
  protected Result<EClass> applyRuleEObjectEClass(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    EClass c = null; // output parameter
    
    {
      InputOutput.<EObject>println(o);
      InputOutput.<String>println(this.myString);
      boolean _add = this.strings.add(this.myString);
      /* strings.add(myString) */
      if (!_add) {
        sneakyThrowRuleFailedException("strings.add(myString)");
      }
      EClass _eClass = o.eClass();
      boolean _add_1 = this.eClasses.add(_eClass);
      /* eClasses.add(o.eClass) */
      if (!Boolean.valueOf(_add_1)) {
        sneakyThrowRuleFailedException("eClasses.add(o.eClass)");
      }
    }
    return new Result<EClass>(c);
  }
}
'''
		)
	}

	@Test
	def testExpressionsInConclusion() {
		testFiles.testTwoExpressionsInConclusion.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result2;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.xtext.util.PolymorphicDispatcher;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String TWOEXPRESSIONSINCONCLUSION = "it.xsemantics.test.rules.TwoExpressionsInConclusion";
  
  private PolymorphicDispatcher<Result2<EObject,EStructuralFeature>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher2(
    	"typeImpl", 3, "|-", ":", ":");
  }
  
  public Result2<EObject,EStructuralFeature> type(final EClass c) {
    return type(new RuleEnvironment(), null, c);
  }
  
  public Result2<EObject,EStructuralFeature> type(final RuleEnvironment _environment_, final EClass c) {
    return type(_environment_, null, c);
  }
  
  public Result2<EObject,EStructuralFeature> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c) {
    try {
    	return typeInternal(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	return resultForFailure2(_e_type);
    }
  }
  
  protected Result2<EObject,EStructuralFeature> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c) {
    try {
    	checkParamsNotNull(c);
    	return typeDispatcher.invoke(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EClass c, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result2<EObject,EStructuralFeature> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass cl) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result2<EObject,EStructuralFeature> _result_ = applyRuleTwoExpressionsInConclusion(G, _subtrace_, cl);
      addToTrace(_trace_, ruleName("TwoExpressionsInConclusion") + stringRepForEnv(G) + " |- " + stringRep(cl) + " : " + stringRep(_result_.getFirst()) + " : " + stringRep(_result_.getSecond()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleTwoExpressionsInConclusion) {
      typeThrowException(ruleName("TwoExpressionsInConclusion") + stringRepForEnv(G) + " |- " + stringRep(cl) + " : " + "EClass" + " : " + "EStructuralFeature",
      	TWOEXPRESSIONSINCONCLUSION,
      	e_applyRuleTwoExpressionsInConclusion, cl, new ErrorInformation[] {new ErrorInformation(cl)});
      return null;
    }
  }
  
  protected Result2<EObject,EStructuralFeature> applyRuleTwoExpressionsInConclusion(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass cl) throws RuleFailedException {
    
    EList<EStructuralFeature> _eAllStructuralFeatures = cl.getEAllStructuralFeatures();
    EStructuralFeature _head = IterableExtensions.<EStructuralFeature>head(_eAllStructuralFeatures);
    return new Result2<EObject,EStructuralFeature>(cl, _head);
  }
}
'''
		)
	}
	
	@Test
	def testAccessToThisInExpressionsInConclusion() {
		testFiles.testAccessToThisInExpressionInConclusion.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import com.google.inject.Inject;
import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import java.util.List;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.util.PolymorphicDispatcher;
import org.eclipse.xtext.xbase.lib.InputOutput;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String EOBJECTECLASS = "it.xsemantics.test.rules.EObjectEClass";
  
  /**
   * a utility field
   */
  @Inject
  private List<String> strings;
  
  @Inject
  private String myString;
  
  /**
   * another utility field
   */
  @Inject
  private List<EClass> eClasses;
  
  @Inject
  private List<EClass> classes;
  
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
  }
  
  public List<String> getStrings() {
    return this.strings;
  }
  
  public void setStrings(final List<String> strings) {
    this.strings = strings;
  }
  
  public String getMyString() {
    return this.myString;
  }
  
  public void setMyString(final String myString) {
    this.myString = myString;
  }
  
  public List<EClass> getEClasses() {
    return this.eClasses;
  }
  
  public void setEClasses(final List<EClass> eClasses) {
    this.eClasses = eClasses;
  }
  
  public List<EClass> getClasses() {
    return this.classes;
  }
  
  public void setClasses(final List<EClass> classes) {
    this.classes = classes;
  }
  
  public Result<EClass> type(final EObject o) {
    return type(new RuleEnvironment(), null, o);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject o) {
    return type(_environment_, null, o);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject o) {
    try {
    	return typeInternal(_environment_, _trace_, o);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject o) {
    try {
    	checkParamsNotNull(o);
    	return typeDispatcher.invoke(_environment_, _trace_, o);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject o, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleEObjectEClass(G, _subtrace_, o);
      addToTrace(_trace_, ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleEObjectEClass) {
      typeThrowException(ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + "EClass",
      	EOBJECTECLASS,
      	e_applyRuleEObjectEClass, o, new ErrorInformation[] {new ErrorInformation(o)});
      return null;
    }
  }
  
  protected Result<EClass> applyRuleEObjectEClass(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    
    EClass _xblockexpression = null;
    {
      InputOutput.<TypeSystem>println(this);
      EObject _clone = this.<EObject>clone(o);
      EClass _eClass = _clone.eClass();
      _xblockexpression = (_eClass);
    }
    return new Result<EClass>(_xblockexpression);
  }
}
'''
		)
	}

	@Test
	def testAccessToInjectedFieldsInExpressionsInConclusion() {
		testFiles.testAccessToInjectedFieldsInExpressionInConclusion.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import com.google.inject.Inject;
import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import java.util.List;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String EOBJECTECLASS = "it.xsemantics.test.rules.EObjectEClass";
  
  /**
   * a utility field
   */
  @Inject
  private List<String> strings;
  
  @Inject
  private String myString;
  
  /**
   * another utility field
   */
  @Inject
  private List<EClass> eClasses;
  
  @Inject
  private List<EClass> classes;
  
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
  }
  
  public List<String> getStrings() {
    return this.strings;
  }
  
  public void setStrings(final List<String> strings) {
    this.strings = strings;
  }
  
  public String getMyString() {
    return this.myString;
  }
  
  public void setMyString(final String myString) {
    this.myString = myString;
  }
  
  public List<EClass> getEClasses() {
    return this.eClasses;
  }
  
  public void setEClasses(final List<EClass> eClasses) {
    this.eClasses = eClasses;
  }
  
  public List<EClass> getClasses() {
    return this.classes;
  }
  
  public void setClasses(final List<EClass> classes) {
    this.classes = classes;
  }
  
  public Result<EClass> type(final EObject o) {
    return type(new RuleEnvironment(), null, o);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject o) {
    return type(_environment_, null, o);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject o) {
    try {
    	return typeInternal(_environment_, _trace_, o);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject o) {
    try {
    	checkParamsNotNull(o);
    	return typeDispatcher.invoke(_environment_, _trace_, o);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject o, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleEObjectEClass(G, _subtrace_, o);
      addToTrace(_trace_, ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleEObjectEClass) {
      typeThrowException(ruleName("EObjectEClass") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + "EClass",
      	EOBJECTECLASS,
      	e_applyRuleEObjectEClass, o, new ErrorInformation[] {new ErrorInformation(o)});
      return null;
    }
  }
  
  protected Result<EClass> applyRuleEObjectEClass(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    
    EClass _get = this.classes.get(0);
    return new Result<EClass>(_get);
  }
}
'''
		)
	}

	@Test
	def testSystemWithValidatorExtends() {
		testFiles.testCheckRuleWithValidatorExtends.assertCorrectJavaCodeGeneration(
			null,
'''
package it.xsemantics.test.validation;

import com.google.inject.Inject;
import it.xsemantics.runtime.validation.XsemanticsValidatorErrorGenerator;
import it.xsemantics.test.TypeSystem;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.validation.AbstractDeclarativeValidator;
import org.eclipse.xtext.validation.Check;

public class TypeSystemValidator extends AbstractDeclarativeValidator {
  @Inject
  protected XsemanticsValidatorErrorGenerator errorGenerator;
  
  @Inject
  protected TypeSystem xsemanticsSystem;
  
  protected TypeSystem getXsemanticsSystem() {
    return this.xsemanticsSystem;
  }
  
  @Check
  public void checkEObject(final EObject obj) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkEObject(obj),
    		obj);
  }
}
'''
		)
	}

	@Test
	def testSystemWithExtends() {
		testFiles.testJudgmentDescriptionsWithErrorSpecification.
			parseWithBaseSystemAndAssertNoError
			(
				testFiles.testSystemExtendsSystemWithJudgmentsReferringToEcore,
				testFiles.testSystemExtendsExtendedTypeSystem
			).assertCorrectJavaCodeGeneration(
"ExtendedTypeSystem2",
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.test.ExtendedTypeSystem;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class ExtendedTypeSystem2 extends ExtendedTypeSystem {
  public final static String FROMTYPESYSTEM = "it.xsemantics.test.rules.FromTypeSystem";
  
  public final static String FROMEXTENDEDTYPESYSTEM = "it.xsemantics.test.rules.FromExtendedTypeSystem";
  
  public final static String FROMTHISTYPESYSTEM = "it.xsemantics.test.rules.FromThisTypeSystem";
  
  private PolymorphicDispatcher<Result<Boolean>> type2Dispatcher;
  
  public ExtendedTypeSystem2() {
    init();
  }
  
  @Override
  public void init() {
    super.init();
    type2Dispatcher = buildPolymorphicDispatcher1(
    	"type2Impl", 4, "||-", ":");
  }
  
  public Result<Boolean> type2(final EClass c1, final EClass c2) {
    return type2(new RuleEnvironment(), null, c1, c2);
  }
  
  public Result<Boolean> type2(final RuleEnvironment _environment_, final EClass c1, final EClass c2) {
    return type2(_environment_, null, c1, c2);
  }
  
  public Result<Boolean> type2(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) {
    try {
    	return type2Internal(_environment_, _trace_, c1, c2);
    } catch (Exception _e_type2) {
    	return resultForFailure(_e_type2);
    }
  }
  
  public Result<Boolean> checkEObject(final EObject o) {
    try {
    	return checkEObjectInternal(null, o);
    } catch (Exception e) {
    	return resultForFailure(e);
    }
  }
  
  protected Result<Boolean> checkEObjectInternal(final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    
    {
      /* empty |- o : var EClass c */
      EClass c = null;
      Result<EClass> result = typeInternal(emptyEnvironment(), _trace_, o);
      checkAssignableTo(result.getFirst(), EClass.class);
      c = (EClass) result.getFirst();
      
      /* empty |- o.eClass <: c */
      EClass _eClass = o.eClass();
      subtypeInternal(emptyEnvironment(), _trace_, _eClass, c);
    }
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> type2Internal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) {
    try {
    	checkParamsNotNull(c1, c2);
    	return type2Dispatcher.invoke(_environment_, _trace_, c1, c2);
    } catch (Exception _e_type2) {
    	sneakyThrowRuleFailedException(_e_type2);
    	return null;
    }
  }
  
  protected void type2ThrowException(final String _error, final String _issue, final Exception _ex, final EClass c1, final EClass c2, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject c) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleFromTypeSystem(G, _subtrace_, c);
      addToTrace(_trace_, ruleName("FromTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleFromTypeSystem) {
      typeThrowException(ruleName("FromTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c) + " : " + "EClass",
      	FROMTYPESYSTEM,
      	e_applyRuleFromTypeSystem, c, new ErrorInformation[] {new ErrorInformation(c)});
      return null;
    }
  }
  
  protected Result<EClass> applyRuleFromTypeSystem(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject c) throws RuleFailedException {
    
    /* G |- c.eClass <: c.eClass */
    EClass _eClass = c.eClass();
    EClass _eClass_1 = c.eClass();
    subtypeInternal(G, _trace_, _eClass, _eClass_1);
    EClass _eClass_2 = c.eClass();
    return new Result<EClass>(_eClass_2);
  }
  
  protected Result<Boolean> subtypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleFromExtendedTypeSystem(G, _subtrace_, c1, c2);
      addToTrace(_trace_, ruleName("FromExtendedTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c1) + " <: " + stringRep(c2));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleFromExtendedTypeSystem) {
      subtypeThrowException(ruleName("FromExtendedTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c1) + " <: " + stringRep(c2),
      	FROMEXTENDEDTYPESYSTEM,
      	e_applyRuleFromExtendedTypeSystem, c1, c2, new ErrorInformation[] {new ErrorInformation(c1), new ErrorInformation(c2)});
      return null;
    }
  }
  
  protected Result<Boolean> applyRuleFromExtendedTypeSystem(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    
    /* G ||- c1 : c2 */
    type2Internal(G, _trace_, c1, c2);
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> type2Impl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleFromThisTypeSystem(G, _subtrace_, c1, c2);
      addToTrace(_trace_, ruleName("FromThisTypeSystem") + stringRepForEnv(G) + " ||- " + stringRep(c1) + " : " + stringRep(c2));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleFromThisTypeSystem) {
      type2ThrowException(ruleName("FromThisTypeSystem") + stringRepForEnv(G) + " ||- " + stringRep(c1) + " : " + stringRep(c2),
      	FROMTHISTYPESYSTEM,
      	e_applyRuleFromThisTypeSystem, c1, c2, new ErrorInformation[] {new ErrorInformation(c1), new ErrorInformation(c2)});
      return null;
    }
  }
  
  protected Result<Boolean> applyRuleFromThisTypeSystem(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    
    /* G |- c1 : var EClass o */
    EClass o = null;
    Result<EClass> result = typeInternal(G, _trace_, c1);
    checkAssignableTo(result.getFirst(), EClass.class);
    o = (EClass) result.getFirst();
    
    return new Result<Boolean>(true);
  }
}
''',
'''
package it.xsemantics.test.validation;

import com.google.inject.Inject;
import it.xsemantics.runtime.validation.XsemanticsValidatorErrorGenerator;
import it.xsemantics.test.ExtendedTypeSystem2;
import it.xsemantics.test.validation.ExtendedTypeSystemValidator;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.validation.Check;

public class ExtendedTypeSystem2Validator extends ExtendedTypeSystemValidator {
  @Inject
  protected XsemanticsValidatorErrorGenerator errorGenerator;
  
  @Inject
  protected ExtendedTypeSystem2 xsemanticsSystem;
  
  @Override
  protected ExtendedTypeSystem2 getXsemanticsSystem() {
    return this.xsemanticsSystem;
  }
  
  @Check
  public void checkEObject(final EObject o) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkEObject(o),
    		o);
  }
}
'''
		)
	}

	@Test
	def testRuleOverride() {
		systemExtendsSystemWithRuleOverride.assertCorrectJavaCodeGeneration(
"ExtendedTypeSystemWithRuleOverride",
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.test.ExtendedTypeSystem2;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;

public class ExtendedTypeSystemWithRuleOverride extends ExtendedTypeSystem2 {
  public final static String FROMTYPESYSTEM = "it.xsemantics.test.rules.FromTypeSystem";
  
  public final static String FROMEXTENDEDTYPESYSTEM = "it.xsemantics.test.rules.FromExtendedTypeSystem";
  
  public final static String FROMTHISTYPESYSTEM = "it.xsemantics.test.rules.FromThisTypeSystem";
  
  public ExtendedTypeSystemWithRuleOverride() {
    init();
  }
  
  @Override
  public void init() {
    super.init();
    
  }
  
  @Override
  public Result<Boolean> checkEObject(final EObject o) {
    try {
    	return checkEObjectInternal(null, o);
    } catch (Exception e) {
    	return resultForFailure(e);
    }
  }
  
  @Override
  protected Result<Boolean> checkEObjectInternal(final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    
    {
      /* empty |- o : var EClass c */
      EClass c = null;
      Result<EClass> result = typeInternal(emptyEnvironment(), _trace_, o);
      checkAssignableTo(result.getFirst(), EClass.class);
      c = (EClass) result.getFirst();
      
      /* empty |- o.eClass <: c */
      EClass _eClass = o.eClass();
      subtypeInternal(emptyEnvironment(), _trace_, _eClass, c);
    }
    return new Result<Boolean>(true);
  }
  
  @Override
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject c) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleFromTypeSystem(G, _subtrace_, c);
      addToTrace(_trace_, ruleName("FromTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleFromTypeSystem) {
      typeThrowException(ruleName("FromTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c) + " : " + "EClass",
      	FROMTYPESYSTEM,
      	e_applyRuleFromTypeSystem, c, new ErrorInformation[] {new ErrorInformation(c)});
      return null;
    }
  }
  
  @Override
  protected Result<EClass> applyRuleFromTypeSystem(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject c) throws RuleFailedException {
    
    EClass _eClass = c.eClass();
    return new Result<EClass>(_eClass);
  }
  
  @Override
  protected Result<Boolean> subtypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleFromExtendedTypeSystem(G, _subtrace_, c1, c2);
      addToTrace(_trace_, ruleName("FromExtendedTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c1) + " <: " + stringRep(c2));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleFromExtendedTypeSystem) {
      subtypeThrowException(ruleName("FromExtendedTypeSystem") + stringRepForEnv(G) + " |- " + stringRep(c1) + " <: " + stringRep(c2),
      	FROMEXTENDEDTYPESYSTEM,
      	e_applyRuleFromExtendedTypeSystem, c1, c2, new ErrorInformation[] {new ErrorInformation(c1), new ErrorInformation(c2)});
      return null;
    }
  }
  
  @Override
  protected Result<Boolean> applyRuleFromExtendedTypeSystem(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    
    /* G ||- c1 : c2 */
    type2Internal(G, _trace_, c1, c2);
    return new Result<Boolean>(true);
  }
  
  @Override
  protected Result<Boolean> type2Impl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleFromThisTypeSystem(G, _subtrace_, c1, c2);
      addToTrace(_trace_, ruleName("FromThisTypeSystem") + stringRepForEnv(G) + " ||- " + stringRep(c1) + " : " + stringRep(c2));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleFromThisTypeSystem) {
      type2ThrowException(ruleName("FromThisTypeSystem") + stringRepForEnv(G) + " ||- " + stringRep(c1) + " : " + stringRep(c2),
      	FROMTHISTYPESYSTEM,
      	e_applyRuleFromThisTypeSystem, c1, c2, new ErrorInformation[] {new ErrorInformation(c1), new ErrorInformation(c2)});
      return null;
    }
  }
  
  @Override
  protected Result<Boolean> applyRuleFromThisTypeSystem(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) throws RuleFailedException {
    
    /* G |- c1 : var EClass o */
    EClass o = null;
    Result<EClass> result = typeInternal(G, _trace_, c1);
    checkAssignableTo(result.getFirst(), EClass.class);
    o = (EClass) result.getFirst();
    
    return new Result<Boolean>(true);
  }
}
''',
'''
package it.xsemantics.test.validation;

import com.google.inject.Inject;
import it.xsemantics.runtime.validation.XsemanticsValidatorErrorGenerator;
import it.xsemantics.test.ExtendedTypeSystemWithRuleOverride;
import it.xsemantics.test.validation.ExtendedTypeSystem2Validator;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.validation.Check;

public class ExtendedTypeSystemWithRuleOverrideValidator extends ExtendedTypeSystem2Validator {
  @Inject
  protected XsemanticsValidatorErrorGenerator errorGenerator;
  
  @Inject
  protected ExtendedTypeSystemWithRuleOverride xsemanticsSystem;
  
  @Override
  protected ExtendedTypeSystemWithRuleOverride getXsemanticsSystem() {
    return this.xsemanticsSystem;
  }
  
  @Override
  @Check
  public void checkEObject(final EObject o) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkEObject(o),
    		o);
  }
}
'''
		)
	}

	@Test
	def testJudgmentOverride() {
		systemExtendsSystemWithJudgmentOverride.assertCorrectJavaCodeGeneration(
"ExtendedTypeSystemWithJudgmentOverride",
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.test.ExtendedTypeSystem2;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class ExtendedTypeSystemWithJudgmentOverride extends ExtendedTypeSystem2 {
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  private PolymorphicDispatcher<Result<Boolean>> subtypeDispatcher;
  
  public ExtendedTypeSystemWithJudgmentOverride() {
    init();
  }
  
  @Override
  public void init() {
    super.init();
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
    subtypeDispatcher = buildPolymorphicDispatcher1(
    	"subtypeImpl", 4, "|-", "<:");
  }
  
  @Override
  public Result<EClass> type(final EObject obj) {
    return type(new RuleEnvironment(), null, obj);
  }
  
  @Override
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject obj) {
    return type(_environment_, null, obj);
  }
  
  @Override
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject obj) {
    try {
    	return typeInternal(_environment_, _trace_, obj);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  @Override
  public Result<Boolean> subtype(final EClass c1, final EClass c2) {
    return subtype(new RuleEnvironment(), null, c1, c2);
  }
  
  @Override
  public Result<Boolean> subtype(final RuleEnvironment _environment_, final EClass c1, final EClass c2) {
    return subtype(_environment_, null, c1, c2);
  }
  
  @Override
  public Result<Boolean> subtype(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) {
    try {
    	return subtypeInternal(_environment_, _trace_, c1, c2);
    } catch (Exception _e_subtype) {
    	return resultForFailure(_e_subtype);
    }
  }
  
  @Override
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject obj) {
    try {
    	checkParamsNotNull(obj);
    	return typeDispatcher.invoke(_environment_, _trace_, obj);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  @Override
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject obj, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  @Override
  protected Result<Boolean> subtypeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass c1, final EClass c2) {
    try {
    	checkParamsNotNull(c1, c2);
    	return subtypeDispatcher.invoke(_environment_, _trace_, c1, c2);
    } catch (Exception _e_subtype) {
    	sneakyThrowRuleFailedException(_e_subtype);
    	return null;
    }
  }
  
  @Override
  protected void subtypeThrowException(final String _error, final String _issue, final Exception _ex, final EClass c1, final EClass c2, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    
    String _stringRep = this.stringRep(c1);
    String _plus = (_stringRep + " not <: ");
    String _stringRep_1 = this.stringRep(c2);
    String _plus_1 = (_plus + _stringRep_1);
    String error = _plus_1;
    EObject source = c1;
    EClass _eClass = c1.eClass();
    EStructuralFeature _eContainingFeature = _eClass.eContainingFeature();
    EStructuralFeature feature = _eContainingFeature;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(source, feature));
  }
}
''',
null
		)
	}

	@Test
	def testOverrideJudgmentWithDifferentParamNames() {
		loadBaseSystems.
			parseWithBaseSystemAndAssertNoError(
				testFiles.testOverrideJudgmentWithDifferentParamNames
			).
		assertCorrectJavaCodeGeneration(
"ExtendedTypeSystemWithJudgmentOverride",
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.test.ExtendedTypeSystem2;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class ExtendedTypeSystemWithJudgmentOverride extends ExtendedTypeSystem2 {
  private PolymorphicDispatcher<Result<Boolean>> subtypeDispatcher;
  
  public ExtendedTypeSystemWithJudgmentOverride() {
    init();
  }
  
  @Override
  public void init() {
    super.init();
    subtypeDispatcher = buildPolymorphicDispatcher1(
    	"subtypeImpl", 4, "|-", "<:");
  }
  
  @Override
  public Result<Boolean> subtype(final EClass left, final EClass right) {
    return subtype(new RuleEnvironment(), null, left, right);
  }
  
  @Override
  public Result<Boolean> subtype(final RuleEnvironment _environment_, final EClass left, final EClass right) {
    return subtype(_environment_, null, left, right);
  }
  
  @Override
  public Result<Boolean> subtype(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass left, final EClass right) {
    try {
    	return subtypeInternal(_environment_, _trace_, left, right);
    } catch (Exception _e_subtype) {
    	return resultForFailure(_e_subtype);
    }
  }
  
  @Override
  protected Result<Boolean> subtypeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EClass left, final EClass right) {
    try {
    	checkParamsNotNull(left, right);
    	return subtypeDispatcher.invoke(_environment_, _trace_, left, right);
    } catch (Exception _e_subtype) {
    	sneakyThrowRuleFailedException(_e_subtype);
    	return null;
    }
  }
  
  @Override
  protected void subtypeThrowException(final String _error, final String _issue, final Exception _ex, final EClass left, final EClass right, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
}
''',
null
		)
	}

	@Test
	def testErrorSpecifications() {
		testFiles.testErrorSpecifications.assertCorrectJavaCodeGeneration(
'''
package it.xsemantics.test;

import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.xtext.util.PolymorphicDispatcher;

public class TypeSystem extends XsemanticsRuntimeSystem {
  public final static String TYPEEOBJECT = "it.xsemantics.test.rules.TypeEObject";
  
  public final static String TYPEECLASS = "it.xsemantics.test.rules.TypeEClass";
  
  public final static String SUBTYPEEOBJECT = "it.xsemantics.test.rules.SubtypeEObject";
  
  public final static String SUBTYPEECLASS = "it.xsemantics.test.rules.SubtypeEClass";
  
  private PolymorphicDispatcher<Result<EClass>> typeDispatcher;
  
  private PolymorphicDispatcher<Result<Boolean>> subtypeDispatcher;
  
  public TypeSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
    subtypeDispatcher = buildPolymorphicDispatcher1(
    	"subtypeImpl", 4, "|-", "<:");
  }
  
  public Result<EClass> type(final EObject c) {
    return type(new RuleEnvironment(), null, c);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final EObject c) {
    return type(_environment_, null, c);
  }
  
  public Result<EClass> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject c) {
    try {
    	return typeInternal(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  public Result<Boolean> subtype(final EObject left, final EObject right) {
    return subtype(new RuleEnvironment(), null, left, right);
  }
  
  public Result<Boolean> subtype(final RuleEnvironment _environment_, final EObject left, final EObject right) {
    return subtype(_environment_, null, left, right);
  }
  
  public Result<Boolean> subtype(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject left, final EObject right) {
    try {
    	return subtypeInternal(_environment_, _trace_, left, right);
    } catch (Exception _e_subtype) {
    	return resultForFailure(_e_subtype);
    }
  }
  
  protected Result<EClass> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject c) {
    try {
    	checkParamsNotNull(c);
    	return typeDispatcher.invoke(_environment_, _trace_, c);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject c, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    
    String _plus = ("this " + c);
    String _plus_1 = (_plus + " made an error!");
    String error = _plus_1;
    EObject source = c;
    EClass _eClass = c.eClass();
    EStructuralFeature _eContainingFeature = _eClass.eContainingFeature();
    EStructuralFeature feature = _eContainingFeature;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(source, feature));
  }
  
  protected Result<Boolean> subtypeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject left, final EObject right) {
    try {
    	checkParamsNotNull(left, right);
    	return subtypeDispatcher.invoke(_environment_, _trace_, left, right);
    } catch (Exception _e_subtype) {
    	sneakyThrowRuleFailedException(_e_subtype);
    	return null;
    }
  }
  
  protected void subtypeThrowException(final String _error, final String _issue, final Exception _ex, final EObject left, final EObject right, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleTypeEObject(G, _subtrace_, o);
      addToTrace(_trace_, ruleName("TypeEObject") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleTypeEObject) {
      typeThrowException(ruleName("TypeEObject") + stringRepForEnv(G) + " |- " + stringRep(o) + " : " + "EClass",
      	TYPEEOBJECT,
      	e_applyRuleTypeEObject, o, new ErrorInformation[] {new ErrorInformation(o)});
      return null;
    }
  }
  
  protected Result<EClass> applyRuleTypeEObject(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject o) throws RuleFailedException {
    
    EClass _eClass = o.eClass();
    return new Result<EClass>(_eClass);
  }
  
  protected Result<EClass> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<EClass> _result_ = applyRuleTypeEClass(G, _subtrace_, c);
      addToTrace(_trace_, ruleName("TypeEClass") + stringRepForEnv(G) + " |- " + stringRep(c) + " : " + stringRep(_result_.getFirst()));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleTypeEClass) {
      
      String error = "unexpected error!";
      EObject source = c;
      EClass _eClass = c.eClass();
      EStructuralFeature _eContainingFeature = _eClass.eContainingFeature();
      EStructuralFeature feature = _eContainingFeature;
      throwRuleFailedException(error,
      	TYPEECLASS, e_applyRuleTypeEClass, new ErrorInformation(source, feature));
      return null;
    }
  }
  
  protected Result<EClass> applyRuleTypeEClass(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass c) throws RuleFailedException {
    
    return new Result<EClass>(c);
  }
  
  protected Result<Boolean> subtypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject left, final EObject right) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleSubtypeEObject(G, _subtrace_, left, right);
      addToTrace(_trace_, ruleName("SubtypeEObject") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleSubtypeEObject) {
      
      String error = "Unhandled case";
      EObject source = left;
      throwRuleFailedException(error,
      	SUBTYPEEOBJECT, e_applyRuleSubtypeEObject, new ErrorInformation(source, null));
      return null;
    }
  }
  
  protected Result<Boolean> applyRuleSubtypeEObject(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EObject left, final EObject right) throws RuleFailedException {
    
    /* fail */
    throwForExplicitFail();
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass left, final EClass right) throws RuleFailedException {
    try {
      RuleApplicationTrace _subtrace_ = newTrace(_trace_);
      Result<Boolean> _result_ = applyRuleSubtypeEClass(G, _subtrace_, left, right);
      addToTrace(_trace_, ruleName("SubtypeEClass") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right));
      addAsSubtrace(_trace_, _subtrace_);
      return _result_;
    } catch (Exception e_applyRuleSubtypeEClass) {
      subtypeThrowException(ruleName("SubtypeEClass") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right),
      	SUBTYPEECLASS,
      	e_applyRuleSubtypeEClass, left, right, new ErrorInformation[] {new ErrorInformation(left), new ErrorInformation(right)});
      return null;
    }
  }
  
  protected Result<Boolean> applyRuleSubtypeEClass(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EClass left, final EClass right) throws RuleFailedException {
    
    boolean _isSuperTypeOf = right.isSuperTypeOf(left);
    /* right.isSuperTypeOf(left) */
    if (!Boolean.valueOf(_isSuperTypeOf)) {
      sneakyThrowRuleFailedException("right.isSuperTypeOf(left)");
    }
    return new Result<Boolean>(true);
  }
}
''',
null
		)
	}

	@Test
	def testSystemExtendsSystemWithValidatorExtends() {
		testFiles.testBaseSystemWithValidatorExtends.
			parseWithBaseSystemAndAssertNoError
			(
				testFiles.testSystemExtendsSystemWithValidatorExtends
			).
		assertCorrectJavaCodeGeneration(
"ExtendedTypeSystem",
null,
'''
package it.xsemantics.test.validation;

import com.google.inject.Inject;
import it.xsemantics.runtime.validation.XsemanticsValidatorErrorGenerator;
import it.xsemantics.test.ExtendedTypeSystem;
import it.xsemantics.test.validation.TypeSystemValidator;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.validation.Check;

public class ExtendedTypeSystemValidator extends TypeSystemValidator {
  @Inject
  protected XsemanticsValidatorErrorGenerator errorGenerator;
  
  @Inject
  protected ExtendedTypeSystem xsemanticsSystem;
  
  @Override
  protected ExtendedTypeSystem getXsemanticsSystem() {
    return this.xsemanticsSystem;
  }
  
  @Override
  @Check
  public void checkEObject(final EObject o) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkEObject(o),
    		o);
  }
  
  @Check
  public void checkEClass(final EClass o) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkEClass(o),
    		o);
  }
}
'''
		)
	}

	def private assertCorrectJavaCodeGeneration(CharSequence input, CharSequence expected) {
		assertCorrectJavaCodeGeneration(input, expected, null)		
	}

	def private assertCorrectJavaCodeGeneration(CharSequence input, CharSequence expected, CharSequence expectedValidator) {
		parse(input).assertCorrectJavaCodeGeneration(null, expected, expectedValidator)
	}

	def private assertCorrectJavaCodeGeneration(XsemanticsSystem system, 
		String prefix, CharSequence expected, CharSequence expectedValidator
	) {
		system.compileAll [
			for (e : allGeneratedResources.entrySet) {
				if (prefix == null || e.key.contains(prefix)) {
					if (e.key.endsWith("Validator.java") && expectedValidator != null) {
						// check the expected Java code for the validator
						assertEquals(expectedValidator.toString, e.value.toString)
					} else if (!e.key.endsWith("Validator.java") && expected != null) {
						// check the expected Java code for the system
						assertEquals(expected.toString, e.value.toString)
					}
				}
			}
			
			
			// this will issue Java generation
			compileToJava
		]
	}
	
}