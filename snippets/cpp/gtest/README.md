<div align="center">
  <img
    alt="logo"
    src="logo.png"
  />
  <h1>
    snippets-gtest
  </h1>
  <p>
    Collection of C++ code snippets for Google Test in VS Code.
  </p>
</div>

<hr>

## Table of contents <!-- omit from toc -->

- [Snippets](#snippets)
  - [Asserts](#asserts)
  - [Controls](#controls)
  - [Expects](#expects)
  - [Macros](#macros)

## Snippets

Here is the list of snippets included in this collection.

<!-- SNIPPETS:BEGIN -->

### Asserts

---

**Prefix:** `gtaTHAT`  
**Description:** Checks that `value` matches the matcher `matcher`.  
**Output:**

```txt
ASSERT_THAT(${1:value}, ${2:matcher});$0
```

---

**Prefix:** `gtaTRUE`  
**Description:** Checks that `condition` is true.  
**Output:**

```txt
ASSERT_TRUE(${1:condition});$0
```

---

**Prefix:** `gtaFALSE`  
**Description:** Checks that `condition` is false.  
**Output:**

```txt
ASSERT_FALSE(${1:condition});$0
```

---

**Prefix:** `gtaEQ`  
**Description:** Checks that `val1 == val2`.  
**Output:**

```txt
ASSERT_EQ(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaNE`  
**Description:** Checks that `val1 != val2`.  
**Output:**

```txt
ASSERT_NE(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaLT`  
**Description:** Checks that `val1 < val2`.  
**Output:**

```txt
ASSERT_LT(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaLE`  
**Description:** Checks that `val1 <= val2`.  
**Output:**

```txt
ASSERT_LE(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaGT`  
**Description:** Checks that `val1 > val2`.  
**Output:**

```txt
ASSERT_GT(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaGE`  
**Description:** Checks that `val1 >= val2`.  
**Output:**

```txt
ASSERT_GE(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaSTREQ`  
**Description:** Checks that the C-strings `str1` and `str2` are equal.  
**Output:**

```txt
ASSERT_STREQ(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gtaSTRNE`  
**Description:** Checks that the C-strings `str1` and `str2` are not equal.  
**Output:**

```txt
ASSERT_STRNE(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gtaSTRCASEEQ`  
**Description:** Checks that the C-strings `str1` and `str2` are equal, ignoring case.  
**Output:**

```txt
ASSERT_STRCASEEQ(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gtaSTRCASENE`  
**Description:** Checks that the C-strings `str1` and `str2` are not equal, ignoring case.  
**Output:**

```txt
ASSERT_STRCASENE(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gtaFEQ`  
**Description:** Checks that the floats `val1` and `val2` are almost equal.  
**Output:**

```txt
ASSERT_FLOAT_EQ(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaDEQ`  
**Description:** Checks that the doubles `val1` and `val2` are almost equal.  
**Output:**

```txt
ASSERT_DOUBLE_EQ(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gtaNEAR`  
**Description:** Checks that `|val1 - val2| <= abs_error`.  
**Output:**

```txt
ASSERT_NEAR(${1:val1}, ${2:val2}, ${3:abs_error});$0
```

---

**Prefix:** `gtaTHROW`  
**Description:** Checks that `statement` throws an exception of type `exception_type`.  
**Output:**

```txt
ASSERT_THROW(${1:statement}, ${2:exception_type});$0
```

---

**Prefix:** `gtaANYTHROW`  
**Description:** Checks that `statement` throws any exception.  
**Output:**

```txt
ASSERT_ANY_THROW(${1:statement});$0
```

---

**Prefix:** `gtaNOTHROW`  
**Description:** Checks that `statement` does not throw any exception.  
**Output:**

```txt
ASSERT_NO_THROW(${1:statement});$0
```

---

**Prefix:** `gtaP1`  
**Description:** Checks the unary predicate `pred` on `v1`.  
**Output:**

```txt
ASSERT_PRED1(${1:pred}, ${2:v1});$0
```

---

**Prefix:** `gtaP2`  
**Description:** Checks the binary predicate `pred` on `v1, v2`.  
**Output:**

```txt
ASSERT_PRED2(${1:pred}, ${2:v1}, ${3:v2});$0
```

---

**Prefix:** `gtaP3`  
**Description:** Checks the ternary predicate `pred` on `v1, v2, v3`.  
**Output:**

```txt
ASSERT_PRED3(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

---

**Prefix:** `gtaP4`  
**Description:** Checks the 4-ary predicate `pred` on `v1, v2, v3, v4`.  
**Output:**

```txt
ASSERT_PRED4(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

---

**Prefix:** `gtaP5`  
**Description:** Checks the 5-ary predicate `pred` on `v1, v2, v3, v4, v5`.  
**Output:**

```txt
ASSERT_PRED5(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

---

**Prefix:** `gtaPF1`  
**Description:** Checks the user-defined formatter `fmt` for `v1`.  
**Output:**

```txt
ASSERT_PRED_FORMAT1(${1:fmt}, ${2:v1});$0
```

---

**Prefix:** `gtaPF2`  
**Description:** Checks the user-defined formatter `fmt` for `v1, v2`.  
**Output:**

```txt
ASSERT_PRED_FORMAT2(${1:fmt}, ${2:v1}, ${3:v2});$0
```

---

**Prefix:** `gtaPF3`  
**Description:** Checks the user-defined formatter `fmt` for `v1, v2, v3`.  
**Output:**

```txt
ASSERT_PRED_FORMAT3(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

---

**Prefix:** `gtaPF4`  
**Description:** Checks the user-defined formatter `fmt` for `v1, v2, v3, v4`.  
**Output:**

```txt
ASSERT_PRED_FORMAT4(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

---

**Prefix:** `gtaPF5`  
**Description:** Checks the user-defined formatter `fmt` for `v1, v2, v3, v4, v5`.  
**Output:**

```txt
ASSERT_PRED_FORMAT5(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

---

**Prefix:** `gtaHS`  
**Description:** Checks that the HRESULT `expr` indicates success (SUCCEEDED).  
**Output:**

```txt
ASSERT_HRESULT_SUCCEEDED(${1:expr});$0
```

---

**Prefix:** `gtaHF`  
**Description:** Checks that the HRESULT `expr` indicates failure (FAILED).  
**Output:**

```txt
ASSERT_HRESULT_FAILED(${1:expr});$0
```

---

**Prefix:** `gtaDEATH`  
**Description:** Checks that `statement` causes the process to die and its stderr matches `regex`.  
**Output:**

```txt
ASSERT_DEATH(${1:statement}, ${2:regex});$0
```

---

**Prefix:** `gtaDIS`  
**Description:** Checks death as in ASSERT_DEATH, but skips on unsupported platforms.  
**Output:**

```txt
ASSERT_DEATH_IF_SUPPORTED(${1:statement}, ${2:regex});$0
```

---

**Prefix:** `gtaDDEATH`  
**Description:** Checks death only in debug mode; behaves like ASSERT_DEATH otherwise.  
**Output:**

```txt
ASSERT_DEBUG_DEATH(${1:statement}, ${2:regex});$0
```

---

**Prefix:** `gtaEXIT`  
**Description:** Checks that `statement` exits and that `predicate` and `regex` match its exit code and output.  
**Output:**

```txt
ASSERT_EXIT(${1:statement}, ${2:predicate}, ${3:regex});$0
```

---

### Controls

---

**Prefix:** `gtcSUCCEED`  
**Description:** Explicitly signals that the current test has succeeded.  
**Output:**

```txt
SUCCEED();$0
```

---

**Prefix:** `gtcFAIL`  
**Description:** Generates a fatal failure and aborts the current test immediately.  
**Output:**

```txt
FAIL();$0
```

---

**Prefix:** `gtcAF`  
**Description:** Records a non-fatal failure at the current source location.  
**Output:**

```txt
ADD_FAILURE();$0
```

---

**Prefix:** `gtcAFA`  
**Description:** Records a non-fatal failure at the specified file and line.  
**Output:**

```txt
ADD_FAILURE_AT(${1:file}, ${2:line});$0
```

---

### Expects

---

**Prefix:** `gteTHAT`  
**Description:** Checks that `value` matches `matcher`.  
**Output:**

```txt
EXPECT_THAT(${1:value}, ${2:matcher});$0
```

---

**Prefix:** `gteTRUE`  
**Description:** Checks that `condition` is true.  
**Output:**

```txt
EXPECT_TRUE(${1:condition});$0
```

---

**Prefix:** `gteFALSE`  
**Description:** Checks that `condition` is false.  
**Output:**

```txt
EXPECT_FALSE(${1:condition});$0
```

---

**Prefix:** `gteEQ`  
**Description:** Checks that `val1 == val2`.  
**Output:**

```txt
EXPECT_EQ(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteNE`  
**Description:** Checks that `val1 != val2`.  
**Output:**

```txt
EXPECT_NE(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteLT`  
**Description:** Checks that `val1 < val2`.  
**Output:**

```txt
EXPECT_LT(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteLE`  
**Description:** Checks that `val1 <= val2`.  
**Output:**

```txt
EXPECT_LE(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteGT`  
**Description:** Checks that `val1 > val2`.  
**Output:**

```txt
EXPECT_GT(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteGE`  
**Description:** Checks that `val1 >= val2`.  
**Output:**

```txt
EXPECT_GE(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteSTREQ`  
**Description:** Checks that C-strings `str1` and `str2` are equal.  
**Output:**

```txt
EXPECT_STREQ(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gteSTRNE`  
**Description:** Checks that C-strings `str1` and `str2` are not equal.  
**Output:**

```txt
EXPECT_STRNE(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gteSTRCASEEQ`  
**Description:** Checks that C-strings `str1` and `str2` are equal, ignoring case.  
**Output:**

```txt
EXPECT_STRCASEEQ(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gteSTRCASENE`  
**Description:** Checks that C-strings `str1` and `str2` are not equal, ignoring case.  
**Output:**

```txt
EXPECT_STRCASENE(${1:str1}, ${2:str2});$0
```

---

**Prefix:** `gteFEQ`  
**Description:** Checks that floats `val1` and `val2` are almost equal.  
**Output:**

```txt
EXPECT_FLOAT_EQ(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteDEQ`  
**Description:** Checks that doubles `val1` and `val2` are almost equal.  
**Output:**

```txt
EXPECT_DOUBLE_EQ(${1:val1}, ${2:val2});$0
```

---

**Prefix:** `gteNEAR`  
**Description:** Checks that `|val1 - val2| <= abs_error`.  
**Output:**

```txt
EXPECT_NEAR(${1:val1}, ${2:val2}, ${3:abs_error});$0
```

---

**Prefix:** `gteTHROW`  
**Description:** Checks that `statement` throws an exception of type `exception_type`.  
**Output:**

```txt
EXPECT_THROW(${1:statement}, ${2:exception_type});$0
```

---

**Prefix:** `gteANYTHROW`  
**Description:** Checks that `statement` throws any exception.  
**Output:**

```txt
EXPECT_ANY_THROW(${1:statement});$0
```

---

**Prefix:** `gteNOTHROW`  
**Description:** Checks that `statement` does not throw any exception.  
**Output:**

```txt
EXPECT_NO_THROW(${1:statement});$0
```

---

**Prefix:** `gteP1`  
**Description:** Checks unary predicate `pred` on `v1`.  
**Output:**

```txt
EXPECT_PRED1(${1:pred}, ${2:v1});$0
```

---

**Prefix:** `gteP2`  
**Description:** Checks binary predicate `pred` on `v1, v2`.  
**Output:**

```txt
EXPECT_PRED2(${1:pred}, ${2:v1}, ${3:v2});$0
```

---

**Prefix:** `gteP3`  
**Description:** Checks ternary predicate `pred` on `v1, v2, v3`.  
**Output:**

```txt
EXPECT_PRED3(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

---

**Prefix:** `gteP4`  
**Description:** Checks 4-ary predicate `pred` on `v1, v2, v3, v4`.  
**Output:**

```txt
EXPECT_PRED4(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

---

**Prefix:** `gteP5`  
**Description:** Checks 5-ary predicate `pred` on `v1, v2, v3, v4, v5`.  
**Output:**

```txt
EXPECT_PRED5(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

---

**Prefix:** `gtePF1`  
**Description:** Checks user-defined formatter `fmt` for `v1`.  
**Output:**

```txt
EXPECT_PRED_FORMAT1(${1:fmt}, ${2:v1});$0
```

---

**Prefix:** `gtePF2`  
**Description:** Checks user-defined formatter `fmt` for `v1, v2`.  
**Output:**

```txt
EXPECT_PRED_FORMAT2(${1:fmt}, ${2:v1}, ${3:v2});$0
```

---

**Prefix:** `gtePF3`  
**Description:** Checks user-defined formatter `fmt` for `v1, v2, v3`.  
**Output:**

```txt
EXPECT_PRED_FORMAT3(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

---

**Prefix:** `gtePF4`  
**Description:** Checks user-defined formatter `fmt` for `v1, v2, v3, v4`.  
**Output:**

```txt
EXPECT_PRED_FORMAT4(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

---

**Prefix:** `gtePF5`  
**Description:** Checks user-defined formatter `fmt` for `v1, v2, v3, v4, v5`.  
**Output:**

```txt
EXPECT_PRED_FORMAT5(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

---

**Prefix:** `gteHS`  
**Description:** Checks that HRESULT `expr` indicates success (SUCCEEDED).  
**Output:**

```txt
EXPECT_HRESULT_SUCCEEDED(${1:expr});$0
```

---

**Prefix:** `gteHF`  
**Description:** Checks that HRESULT `expr` indicates failure (FAILED).  
**Output:**

```txt
EXPECT_HRESULT_FAILED(${1:expr});$0
```

---

**Prefix:** `gteDEATH`  
**Description:** Checks that `statement` causes the process to die and stderr matches `regex`.  
**Output:**

```txt
EXPECT_DEATH(${1:statement}, ${2:regex});$0
```

---

**Prefix:** `gteDIS`  
**Description:** Checks death as in EXPECT_DEATH, but skips on unsupported platforms.  
**Output:**

```txt
EXPECT_DEATH_IF_SUPPORTED(${1:statement}, ${2:regex});$0
```

---

**Prefix:** `gteDDEATH`  
**Description:** Checks death only in debug mode; behaves like EXPECT_DEATH otherwise.  
**Output:**

```txt
EXPECT_DEBUG_DEATH(${1:statement}, ${2:regex});$0
```

---

**Prefix:** `gteEXIT`  
**Description:** Checks that `statement` exits and that `predicate` and `regex` match its exit code and output.  
**Output:**

```txt
EXPECT_EXIT(${1:statement}, ${2:predicate}, ${3:regex});$0
```

---

### Macros

---

**Prefix:** `gtmTEST`  
**Description:** Defines a regular test case named `TestName` in the test suite `TestSuiteName`.  
**Output:**

```txt
TEST(${1:TestSuiteName}, ${2:TestName});$0
```

---

**Prefix:** `gtmTF`  
**Description:** Defines a test named `TestName` that uses the fixture `TestFixtureName`.  
**Output:**

```txt
TEST_F(${1:TestFixtureName}, ${2:TestName});$0
```

---

**Prefix:** `gtmTP`  
**Description:** Defines a parameterized test named `TestName` in the fixture `TestFixtureName`.  
**Output:**

```txt
TEST_P(${1:TestFixtureName}, ${2:TestName});$0
```

---

**Prefix:** `gtmITSP`  
**Description:** Instantiates the parameterized test suite `TestSuiteName` with the given `param_generator` under the instantiation name `InstantiationName`.  
**Output:**

```txt
INSTANTIATE_TEST_SUITE_P(${1:InstantiationName}, ${2:TestSuiteName}, ${3:param_generator});$0
```

---

**Prefix:** `gtmITSPg`  
**Description:** Instantiates the parameterized test suite `TestSuiteName` with a custom `NameGenerator` to control test name suffixes.  
**Output:**

```txt
INSTANTIATE_TEST_SUITE_P(${1:InstantiationName}, ${2:TestSuiteName}, ${3:param_generator}, ${4:NameGenerator});$0
```

---

**Prefix:** `gtmGAUPT`  
**Description:** Allows declaration of a parameterized test suite `TestSuiteName` without instantiation.  
**Output:**

```txt
GTEST_ALLOW_UNINSTANTIATED_PARAMETERIZED_TEST(${1:TestSuiteName});$0
```

---

**Prefix:** `gtmTT`  
**Description:** Defines and runs a typed test `TestName` in the typed test suite `TestSuiteName`.  
**Output:**

```txt
TYPED_TEST(${1:TestSuiteName}, ${2:TestName});$0
```

---

**Prefix:** `gtmTTS`  
**Description:** Defines a typed test suite `TestFixtureName` parameterized by `Types`.  
**Output:**

```txt
TYPED_TEST_SUITE(${1:TestFixtureName}, ${2:Types});$0
```

---

**Prefix:** `gtmTTSg`  
**Description:** Defines a typed test suite `TestFixtureName` parameterized by `Types`, using `NameGenerator` to customize test name suffixes.  
**Output:**

```txt
TYPED_TEST_SUITE(${1:TestFixtureName}, ${2:Types}, ${3:NameGenerator});$0
```

---

**Prefix:** `gtmTTSP`  
**Description:** Registers a typed test suite pattern `TestFixtureName` for later instantiation.  
**Output:**

```txt
TYPED_TEST_SUITE_P(${1:TestFixtureName});$0
```

---

**Prefix:** `gtmTTP`  
**Description:** Defines a typed test pattern `TestName` for the typed test suite `TestSuiteName`.  
**Output:**

```txt
TYPED_TEST_P(${1:TestSuiteName}, ${2:TestName});$0
```

---

**Prefix:** `gtmRTSP`  
**Description:** Registers one or more typed test names (`TestName1`, `TestName2`, …) with the typed test suite pattern `TestSuiteName`.  
**Output:**

```txt
REGISTER_TYPED_TEST_SUITE_P(${1:TestSuiteName}, ${2:TestName1}${3:, ${4:TestName2}});$0
```

---

**Prefix:** `gtmITTSP`  
**Description:** Instantiates the typed test suite pattern `TestSuiteName` with the list of `Types` under the name `InstantiationName`.  
**Output:**

```txt
INSTANTIATE_TYPED_TEST_SUITE_P(${1:InstantiationName}, ${2:TestSuiteName}, ${3:Types});$0
```

---

**Prefix:** `gtmFT`  
**Description:** Declares `TestName` in `TestSuiteName` as a friend of its fixture class to grant access to private members.  
**Output:**

```txt
FRIEND_TEST(${1:TestSuiteName}, ${2:TestName});$0
```

---

**Prefix:** `gtmST`  
**Description:** Inserts a trace message that will be printed if a failure occurs in the current scope.  
**Output:**

```txt
SCOPED_TRACE(${1:message});$0
```

---

**Prefix:** `gtmGS`  
**Description:** Skips the remainder of the current test at runtime.  
**Output:**

```txt
GTEST_SKIP();$0
```

---

**Prefix:** `gtmMM`  
**Description:** Defines a mock method `method_name` with return type `return_type` and arguments `args`.  
**Output:**

```txt
MOCK_METHOD(${1:return_type}, ${2:method_name}, (${3:args}));$0
```

---

**Prefix:** `gtmMMs`  
**Description:** Defines a mock method `method_name` with return type `return_type`, arguments `args`, and qualifiers `specs`.  
**Output:**

```txt
MOCK_METHOD(${1:return_type}, ${2:method_name}, (${3:args}), (${4:specs}));$0
```

---

**Prefix:** `gtmEC`  
**Description:** Creates an expectation that the method `method_name(matchers)` will be called on `mock_object`.  
**Output:**

```txt
EXPECT_CALL(${1:mock_object}, ${2:method_name}(${3:matchers}))$0
```

---

**Prefix:** `gtmOC`  
**Description:** Specifies default behavior `action` for calls to `method_name(matchers)` on `mock_object`.  
**Output:**

```txt
ON_CALL(${1:mock_object}, ${2:method_name}(${3:matchers}))$4.WillByDefault(${5:action});$0
```

---
<!-- SNIPPETS:END -->
