import { getAnalytics } from "@/actions/get-analytics";
import { db } from "@/lib/db";
import { Course, Purchase } from "@prisma/client";

jest.mock("../lib/db", () => ({
  db: {
    purchase: {
      findMany: jest.fn(),
    },
  },gi
}));

describe("getAnalytics function", () => {
  it("should return analytics data", async () => {
    const mockPurchases: (Purchase & { course: Course })[] = [
      {
        id: "1",
        courseId: "1",
        userId: "1",
        createdAt: new Date(),
        updatedAt: new Date(),
        course: {
          id: "1",
          userId: "1",
          title: "Test Course",
          price: 100,
          createdAt: new Date(),
          updatedAt: new Date(),
          description: null,
          imageUrl: null,
          isPublished: false,
          categoryId: null,
        },
      },
    ];

    (db.purchase.findMany as jest.Mock).mockResolvedValue(mockPurchases);

    const result = await getAnalytics("1");

    expect(result).toEqual({
      data: [
        {
          name: "Test Course",
          total: 100,
        },
      ],
      totalRevenue: 100,
      totalSales: 1,
    });
  });
});
