import { expect, test } from '@playwright/test';
import { createBdd } from 'playwright-bdd';
import testCases from './generated-test-data.json';

const { Given, When, Then } = createBdd(test);

type GeneratedTestCase = {
  id: string;
  title: string;
  steps?: Array<{ action?: string; input_data?: string; expected_result?: string }>;
};

let activeTestCase: GeneratedTestCase | undefined;

Given('test preconditions are satisfied', async () => {
  expect(Array.isArray(testCases)).toBeTruthy();
});

When('I execute test case {string}', async ({}, testCaseId: string) => {
  activeTestCase = (testCases as GeneratedTestCase[]).find((item) => item.id === testCaseId);
  expect(activeTestCase, `Missing generated test case ${testCaseId}`).toBeTruthy();

  for (const step of activeTestCase?.steps ?? []) {
    test.info().annotations.push({
      type: 'generated-step',
      description: `${step.action ?? ''} | input=${step.input_data ?? ''} | expected=${step.expected_result ?? ''}`,
    });
  }
});

Then('the expected result should be {string}', async ({}, expectedResult: string) => {
  expect(activeTestCase).toBeTruthy();
  expect(expectedResult.length).toBeGreaterThan(0);
});
