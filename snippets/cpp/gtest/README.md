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

**Output:**

```sh
ASSERT_THAT(${1:value}, ${2:matcher});$0
```

**Description:** Checks that `value` matches the matcher `matcher`.

---

**Prefix:** `gtaTRUE`

**Output:**

```sh
ASSERT_TRUE(${1:condition});$0
```

**Description:** Checks that `condition` is true.

---

**Prefix:** `gtaFALSE`

**Output:**

```sh
ASSERT_FALSE(${1:condition});$0
```

**Description:** Checks that `condition` is false.

---

**Prefix:** `gtaEQ`

**Output:**

```sh
ASSERT_EQ(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 == val2`.

---

**Prefix:** `gtaNE`

**Output:**

```sh
ASSERT_NE(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 != val2`.

---

**Prefix:** `gtaLT`

**Output:**

```sh
ASSERT_LT(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 < val2`.

---

**Prefix:** `gtaLE`

**Output:**

```sh
ASSERT_LE(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 <= val2`.

---

**Prefix:** `gtaGT`

**Output:**

```sh
ASSERT_GT(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 > val2`.

---

**Prefix:** `gtaGE`

**Output:**

```sh
ASSERT_GE(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 >= val2`.

---

**Prefix:** `gtaSTREQ`

**Output:**

```sh
ASSERT_STREQ(${1:str1}, ${2:str2});$0
```

**Description:** Checks that the C-strings `str1` and `str2` are equal.

---

**Prefix:** `gtaSTRNE`

**Output:**

```sh
ASSERT_STRNE(${1:str1}, ${2:str2});$0
```

**Description:** Checks that the C-strings `str1` and `str2` are not equal.

---

**Prefix:** `gtaSTRCASEEQ`

**Output:**

```sh
ASSERT_STRCASEEQ(${1:str1}, ${2:str2});$0
```

**Description:** Checks that the C-strings `str1` and `str2` are equal, ignoring case.

---

**Prefix:** `gtaSTRCASENE`

**Output:**

```sh
ASSERT_STRCASENE(${1:str1}, ${2:str2});$0
```

**Description:** Checks that the C-strings `str1` and `str2` are not equal, ignoring case.

---

**Prefix:** `gtaFEQ`

**Output:**

```sh
ASSERT_FLOAT_EQ(${1:val1}, ${2:val2});$0
```

**Description:** Checks that the floats `val1` and `val2` are almost equal.

---

**Prefix:** `gtaDEQ`

**Output:**

```sh
ASSERT_DOUBLE_EQ(${1:val1}, ${2:val2});$0
```

**Description:** Checks that the doubles `val1` and `val2` are almost equal.

---

**Prefix:** `gtaNEAR`

**Output:**

```sh
ASSERT_NEAR(${1:val1}, ${2:val2}, ${3:abs_error});$0
```

**Description:** Checks that `|val1 - val2| <= abs_error`.

---

**Prefix:** `gtaTHROW`

**Output:**

```sh
ASSERT_THROW(${1:statement}, ${2:exception_type});$0
```

**Description:** Checks that `statement` throws an exception of type `exception_type`.

---

**Prefix:** `gtaANYTHROW`

**Output:**

```sh
ASSERT_ANY_THROW(${1:statement});$0
```

**Description:** Checks that `statement` throws any exception.

---

**Prefix:** `gtaNOTHROW`

**Output:**

```sh
ASSERT_NO_THROW(${1:statement});$0
```

**Description:** Checks that `statement` does not throw any exception.

---

**Prefix:** `gtaP1`

**Output:**

```sh
ASSERT_PRED1(${1:pred}, ${2:v1});$0
```

**Description:** Checks the unary predicate `pred` on `v1`.

---

**Prefix:** `gtaP2`

**Output:**

```sh
ASSERT_PRED2(${1:pred}, ${2:v1}, ${3:v2});$0
```

**Description:** Checks the binary predicate `pred` on `v1, v2`.

---

**Prefix:** `gtaP3`

**Output:**

```sh
ASSERT_PRED3(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

**Description:** Checks the ternary predicate `pred` on `v1, v2, v3`.

---

**Prefix:** `gtaP4`

**Output:**

```sh
ASSERT_PRED4(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

**Description:** Checks the 4-ary predicate `pred` on `v1, v2, v3, v4`.

---

**Prefix:** `gtaP5`

**Output:**

```sh
ASSERT_PRED5(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

**Description:** Checks the 5-ary predicate `pred` on `v1, v2, v3, v4, v5`.

---

**Prefix:** `gtaPF1`

**Output:**

```sh
ASSERT_PRED_FORMAT1(${1:fmt}, ${2:v1});$0
```

**Description:** Checks the user-defined formatter `fmt` for `v1`.

---

**Prefix:** `gtaPF2`

**Output:**

```sh
ASSERT_PRED_FORMAT2(${1:fmt}, ${2:v1}, ${3:v2});$0
```

**Description:** Checks the user-defined formatter `fmt` for `v1, v2`.

---

**Prefix:** `gtaPF3`

**Output:**

```sh
ASSERT_PRED_FORMAT3(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

**Description:** Checks the user-defined formatter `fmt` for `v1, v2, v3`.

---

**Prefix:** `gtaPF4`

**Output:**

```sh
ASSERT_PRED_FORMAT4(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

**Description:** Checks the user-defined formatter `fmt` for `v1, v2, v3, v4`.

---

**Prefix:** `gtaPF5`

**Output:**

```sh
ASSERT_PRED_FORMAT5(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

**Description:** Checks the user-defined formatter `fmt` for `v1, v2, v3, v4, v5`.

---

**Prefix:** `gtaHS`

**Output:**

```sh
ASSERT_HRESULT_SUCCEEDED(${1:expr});$0
```

**Description:** Checks that the HRESULT `expr` indicates success (SUCCEEDED).

---

**Prefix:** `gtaHF`

**Output:**

```sh
ASSERT_HRESULT_FAILED(${1:expr});$0
```

**Description:** Checks that the HRESULT `expr` indicates failure (FAILED).

---

**Prefix:** `gtaDEATH`

**Output:**

```sh
ASSERT_DEATH(${1:statement}, ${2:regex});$0
```

**Description:** Checks that `statement` causes the process to die and its stderr matches `regex`.

---

**Prefix:** `gtaDIS`

**Output:**

```sh
ASSERT_DEATH_IF_SUPPORTED(${1:statement}, ${2:regex});$0
```

**Description:** Checks death as in ASSERT_DEATH, but skips on unsupported platforms.

---

**Prefix:** `gtaDDEATH`

**Output:**

```sh
ASSERT_DEBUG_DEATH(${1:statement}, ${2:regex});$0
```

**Description:** Checks death only in debug mode; behaves like ASSERT_DEATH otherwise.

---

**Prefix:** `gtaEXIT`

**Output:**

```sh
ASSERT_EXIT(${1:statement}, ${2:predicate}, ${3:regex});$0
```

**Description:** Checks that `statement` exits and that `predicate` and `regex` match its exit code and output.

---

### Controls

---

**Prefix:** `gtcSUCCEED`

**Output:**

```sh
SUCCEED();$0
```

**Description:** Explicitly signals that the current test has succeeded.

---

**Prefix:** `gtcFAIL`

**Output:**

```sh
FAIL();$0
```

**Description:** Generates a fatal failure and aborts the current test immediately.

---

**Prefix:** `gtcAF`

**Output:**

```sh
ADD_FAILURE();$0
```

**Description:** Records a non-fatal failure at the current source location.

---

**Prefix:** `gtcAFA`

**Output:**

```sh
ADD_FAILURE_AT(${1:file}, ${2:line});$0
```

**Description:** Records a non-fatal failure at the specified file and line.

---

### Expects

---

**Prefix:** `gteTHAT`

**Output:**

```sh
EXPECT_THAT(${1:value}, ${2:matcher});$0
```

**Description:** Checks that `value` matches `matcher`.

---

**Prefix:** `gteTRUE`

**Output:**

```sh
EXPECT_TRUE(${1:condition});$0
```

**Description:** Checks that `condition` is true.

---

**Prefix:** `gteFALSE`

**Output:**

```sh
EXPECT_FALSE(${1:condition});$0
```

**Description:** Checks that `condition` is false.

---

**Prefix:** `gteEQ`

**Output:**

```sh
EXPECT_EQ(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 == val2`.

---

**Prefix:** `gteNE`

**Output:**

```sh
EXPECT_NE(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 != val2`.

---

**Prefix:** `gteLT`

**Output:**

```sh
EXPECT_LT(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 < val2`.

---

**Prefix:** `gteLE`

**Output:**

```sh
EXPECT_LE(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 <= val2`.

---

**Prefix:** `gteGT`

**Output:**

```sh
EXPECT_GT(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 > val2`.

---

**Prefix:** `gteGE`

**Output:**

```sh
EXPECT_GE(${1:val1}, ${2:val2});$0
```

**Description:** Checks that `val1 >= val2`.

---

**Prefix:** `gteSTREQ`

**Output:**

```sh
EXPECT_STREQ(${1:str1}, ${2:str2});$0
```

**Description:** Checks that C-strings `str1` and `str2` are equal.

---

**Prefix:** `gteSTRNE`

**Output:**

```sh
EXPECT_STRNE(${1:str1}, ${2:str2});$0
```

**Description:** Checks that C-strings `str1` and `str2` are not equal.

---

**Prefix:** `gteSTRCASEEQ`

**Output:**

```sh
EXPECT_STRCASEEQ(${1:str1}, ${2:str2});$0
```

**Description:** Checks that C-strings `str1` and `str2` are equal, ignoring case.

---

**Prefix:** `gteSTRCASENE`

**Output:**

```sh
EXPECT_STRCASENE(${1:str1}, ${2:str2});$0
```

**Description:** Checks that C-strings `str1` and `str2` are not equal, ignoring case.

---

**Prefix:** `gteFEQ`

**Output:**

```sh
EXPECT_FLOAT_EQ(${1:val1}, ${2:val2});$0
```

**Description:** Checks that floats `val1` and `val2` are almost equal.

---

**Prefix:** `gteDEQ`

**Output:**

```sh
EXPECT_DOUBLE_EQ(${1:val1}, ${2:val2});$0
```

**Description:** Checks that doubles `val1` and `val2` are almost equal.

---

**Prefix:** `gteNEAR`

**Output:**

```sh
EXPECT_NEAR(${1:val1}, ${2:val2}, ${3:abs_error});$0
```

**Description:** Checks that `|val1 - val2| <= abs_error`.

---

**Prefix:** `gteTHROW`

**Output:**

```sh
EXPECT_THROW(${1:statement}, ${2:exception_type});$0
```

**Description:** Checks that `statement` throws an exception of type `exception_type`.

---

**Prefix:** `gteANYTHROW`

**Output:**

```sh
EXPECT_ANY_THROW(${1:statement});$0
```

**Description:** Checks that `statement` throws any exception.

---

**Prefix:** `gteNOTHROW`

**Output:**

```sh
EXPECT_NO_THROW(${1:statement});$0
```

**Description:** Checks that `statement` does not throw any exception.

---

**Prefix:** `gteP1`

**Output:**

```sh
EXPECT_PRED1(${1:pred}, ${2:v1});$0
```

**Description:** Checks unary predicate `pred` on `v1`.

---

**Prefix:** `gteP2`

**Output:**

```sh
EXPECT_PRED2(${1:pred}, ${2:v1}, ${3:v2});$0
```

**Description:** Checks binary predicate `pred` on `v1, v2`.

---

**Prefix:** `gteP3`

**Output:**

```sh
EXPECT_PRED3(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

**Description:** Checks ternary predicate `pred` on `v1, v2, v3`.

---

**Prefix:** `gteP4`

**Output:**

```sh
EXPECT_PRED4(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

**Description:** Checks 4-ary predicate `pred` on `v1, v2, v3, v4`.

---

**Prefix:** `gteP5`

**Output:**

```sh
EXPECT_PRED5(${1:pred}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

**Description:** Checks 5-ary predicate `pred` on `v1, v2, v3, v4, v5`.

---

**Prefix:** `gtePF1`

**Output:**

```sh
EXPECT_PRED_FORMAT1(${1:fmt}, ${2:v1});$0
```

**Description:** Checks user-defined formatter `fmt` for `v1`.

---

**Prefix:** `gtePF2`

**Output:**

```sh
EXPECT_PRED_FORMAT2(${1:fmt}, ${2:v1}, ${3:v2});$0
```

**Description:** Checks user-defined formatter `fmt` for `v1, v2`.

---

**Prefix:** `gtePF3`

**Output:**

```sh
EXPECT_PRED_FORMAT3(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3});$0
```

**Description:** Checks user-defined formatter `fmt` for `v1, v2, v3`.

---

**Prefix:** `gtePF4`

**Output:**

```sh
EXPECT_PRED_FORMAT4(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4});$0
```

**Description:** Checks user-defined formatter `fmt` for `v1, v2, v3, v4`.

---

**Prefix:** `gtePF5`

**Output:**

```sh
EXPECT_PRED_FORMAT5(${1:fmt}, ${2:v1}, ${3:v2}, ${4:v3}, ${5:v4}, ${6:v5});$0
```

**Description:** Checks user-defined formatter `fmt` for `v1, v2, v3, v4, v5`.

---

**Prefix:** `gteHS`

**Output:**

```sh
EXPECT_HRESULT_SUCCEEDED(${1:expr});$0
```

**Description:** Checks that HRESULT `expr` indicates success (SUCCEEDED).

---

**Prefix:** `gteHF`

**Output:**

```sh
EXPECT_HRESULT_FAILED(${1:expr});$0
```

**Description:** Checks that HRESULT `expr` indicates failure (FAILED).

---

**Prefix:** `gteDEATH`

**Output:**

```sh
EXPECT_DEATH(${1:statement}, ${2:regex});$0
```

**Description:** Checks that `statement` causes the process to die and stderr matches `regex`.

---

**Prefix:** `gteDIS`

**Output:**

```sh
EXPECT_DEATH_IF_SUPPORTED(${1:statement}, ${2:regex});$0
```

**Description:** Checks death as in EXPECT_DEATH, but skips on unsupported platforms.

---

**Prefix:** `gteDDEATH`

**Output:**

```sh
EXPECT_DEBUG_DEATH(${1:statement}, ${2:regex});$0
```

**Description:** Checks death only in debug mode; behaves like EXPECT_DEATH otherwise.

---

**Prefix:** `gteEXIT`

**Output:**

```sh
EXPECT_EXIT(${1:statement}, ${2:predicate}, ${3:regex});$0
```

**Description:** Checks that `statement` exits and that `predicate` and `regex` match its exit code and output.

---

### Macros

---

**Prefix:** `gtmTEST`

**Output:**

```sh
TEST(${1:TestSuiteName}, ${2:TestName});$0
```

**Description:** Defines a regular test case named `TestName` in the test suite `TestSuiteName`.

---

**Prefix:** `gtmTF`

**Output:**

```sh
TEST_F(${1:TestFixtureName}, ${2:TestName});$0
```

**Description:** Defines a test named `TestName` that uses the fixture `TestFixtureName`.

---

**Prefix:** `gtmTP`

**Output:**

```sh
TEST_P(${1:TestFixtureName}, ${2:TestName});$0
```

**Description:** Defines a parameterized test named `TestName` in the fixture `TestFixtureName`.

---

**Prefix:** `gtmITSP`

**Output:**

```sh
INSTANTIATE_TEST_SUITE_P(${1:InstantiationName}, ${2:TestSuiteName}, ${3:param_generator});$0
```

**Description:** Instantiates the parameterized test suite `TestSuiteName` with the given `param_generator` under the instantiation name `InstantiationName`.

---

**Prefix:** `gtmITSPg`

**Output:**

```sh
INSTANTIATE_TEST_SUITE_P(${1:InstantiationName}, ${2:TestSuiteName}, ${3:param_generator}, ${4:NameGenerator});$0
```

**Description:** Instantiates the parameterized test suite `TestSuiteName` with a custom `NameGenerator` to control test name suffixes.

---

**Prefix:** `gtmGAUPT`

**Output:**

```sh
GTEST_ALLOW_UNINSTANTIATED_PARAMETERIZED_TEST(${1:TestSuiteName});$0
```

**Description:** Allows declaration of a parameterized test suite `TestSuiteName` without instantiation.

---

**Prefix:** `gtmTT`

**Output:**

```sh
TYPED_TEST(${1:TestSuiteName}, ${2:TestName});$0
```

**Description:** Defines and runs a typed test `TestName` in the typed test suite `TestSuiteName`.

---

**Prefix:** `gtmTTS`

**Output:**

```sh
TYPED_TEST_SUITE(${1:TestFixtureName}, ${2:Types});$0
```

**Description:** Defines a typed test suite `TestFixtureName` parameterized by `Types`.

---

**Prefix:** `gtmTTSg`

**Output:**

```sh
TYPED_TEST_SUITE(${1:TestFixtureName}, ${2:Types}, ${3:NameGenerator});$0
```

**Description:** Defines a typed test suite `TestFixtureName` parameterized by `Types`, using `NameGenerator` to customize test name suffixes.

---

**Prefix:** `gtmTTSP`

**Output:**

```sh
TYPED_TEST_SUITE_P(${1:TestFixtureName});$0
```

**Description:** Registers a typed test suite pattern `TestFixtureName` for later instantiation.

---

**Prefix:** `gtmTTP`

**Output:**

```sh
TYPED_TEST_P(${1:TestSuiteName}, ${2:TestName});$0
```

**Description:** Defines a typed test pattern `TestName` for the typed test suite `TestSuiteName`.

---

**Prefix:** `gtmRTSP`

**Output:**

```sh
REGISTER_TYPED_TEST_SUITE_P(${1:TestSuiteName}, ${2:TestName1}${3:, ${4:TestName2}});$0
```

**Description:** Registers one or more typed test names (`TestName1`, `TestName2`, …) with the typed test suite pattern `TestSuiteName`.

---

**Prefix:** `gtmITTSP`

**Output:**

```sh
INSTANTIATE_TYPED_TEST_SUITE_P(${1:InstantiationName}, ${2:TestSuiteName}, ${3:Types});$0
```

**Description:** Instantiates the typed test suite pattern `TestSuiteName` with the list of `Types` under the name `InstantiationName`.

---

**Prefix:** `gtmFT`

**Output:**

```sh
FRIEND_TEST(${1:TestSuiteName}, ${2:TestName});$0
```

**Description:** Declares `TestName` in `TestSuiteName` as a friend of its fixture class to grant access to private members.

---

**Prefix:** `gtmST`

**Output:**

```sh
SCOPED_TRACE(${1:message});$0
```

**Description:** Inserts a trace message that will be printed if a failure occurs in the current scope.

---

**Prefix:** `gtmGS`

**Output:**

```sh
GTEST_SKIP();$0
```

**Description:** Skips the remainder of the current test at runtime.

---

**Prefix:** `gtmMM`

**Output:**

```sh
MOCK_METHOD(${1:return_type}, ${2:method_name}, (${3:args}));$0
```

**Description:** Defines a mock method `method_name` with return type `return_type` and arguments `args`.

---

**Prefix:** `gtmMMs`

**Output:**

```sh
MOCK_METHOD(${1:return_type}, ${2:method_name}, (${3:args}), (${4:specs}));$0
```

**Description:** Defines a mock method `method_name` with return type `return_type`, arguments `args`, and qualifiers `specs`.

---

**Prefix:** `gtmEC`

**Output:**

```sh
EXPECT_CALL(${1:mock_object}, ${2:method_name}(${3:matchers}))$0
```

**Description:** Creates an expectation that the method `method_name(matchers)` will be called on `mock_object`.

---

**Prefix:** `gtmOC`

**Output:**

```sh
ON_CALL(${1:mock_object}, ${2:method_name}(${3:matchers}))$4.WillByDefault(${5:action});$0
```

**Description:** Specifies default behavior `action` for calls to `method_name(matchers)` on `mock_object`.

---
<!-- SNIPPETS:END -->
